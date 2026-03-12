resource "aws_launch_template" "this" {
  name_prefix   = "compute-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type

  user_data = base64encode(var.user_data)

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "compute-instance"
    }
  }

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

}

resource "aws_security_group" "alb_sg" {
  name_prefix = "compute-alb-sg-"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2_sg" {
  name_prefix = "compute-ec2-sg-"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [
      aws_security_group.alb_sg.id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb_target_group" "this" {
  name_prefix = "ctg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  deregistration_delay = 30

}

resource "aws_lb" "this" {
  name_prefix        = "calb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet_ids
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_autoscaling_group" "this" {
  name_prefix = "compute-asg-"

  desired_capacity = var.desired_capacity
  max_size         = var.desired_capacity
  min_size         = var.desired_capacity

  vpc_zone_identifier = var.public_subnet_ids

  target_group_arns = [
    aws_lb_target_group.this.arn
  ]

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [
      # launch_template[0].version,
      desired_capacity,
      max_size,
      min_size
    ]
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
      instance_warmup        = 30
    }
  }

  health_check_type         = "EC2"
  health_check_grace_period = 60

  tag {
    key                 = "Name"
    value               = "compute-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "ForceRefresh"
    value               = "5.0"
    propagate_at_launch = false
  }
}

