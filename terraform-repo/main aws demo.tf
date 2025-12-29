terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.26.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

# Data sources must be outside the provider block
#//data "aws_ec2_instance_type" "example" {
#instance_type = "t2.micro"
#//////}

#//Unexpected attribute: An attribute named "credentials" is not expected hereTerraform
#//Unexpected attribute: An attribute named "project" is not expected hereTerraform
#//Unexpected attribute: An attribute named "zone" is not expected hereTerraform


