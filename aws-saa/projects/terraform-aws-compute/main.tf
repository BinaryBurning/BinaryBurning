module "compute" {
  source = "./modules/compute"

  # source = "./terraform-aws-compute"

  user_data = file("${path.module}/user_data.sh")

  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids

  instance_type    = var.instance_type
  ami_id           = var.ami_id
  desired_capacity = var.desired_capacity
  # user_data        = var.user_data
}
