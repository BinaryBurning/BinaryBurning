resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type = "t2.micro"

  tags = {
    Name = "PracticeInstance"
  }
}

data "aws_ec2_instance_type" "micro" {
  instance_type = "t2.micro"
}

output "micro_info" {
  value = data.aws_ec2_instance_type.micro
}
