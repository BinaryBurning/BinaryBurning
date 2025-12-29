resource "aws_s3_bucket" "my-s3-example-tf" {
  # bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
