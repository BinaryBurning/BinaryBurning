variable "vpc_id" {
  description = "VPC ID where compute resources will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnets for ALB and EC2 instances"
  type        = list(string)
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "user_data" {
  type        = string
  description = "User data script for EC2"
}

variable "desired_capacity" {
  type        = number
  description = "Number of EC2 instances"
}
