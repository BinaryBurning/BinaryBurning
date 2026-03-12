variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID from the infra repo"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnets for ALB and EC2"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "desired_capacity" {
  description = "Number of EC2 instances in the ASG"
  type        = number
  default     = 1
}

variable "user_data" {
  description = "User data script for EC2"
  type        = string
  default     = ""
}

