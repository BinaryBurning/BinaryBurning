resource "aws_s3_bucket" "my-s3-example-tf" {
  bucket = "my-tf-test-bucket-uniq-1101"
  # bucket = "my-tf-test-bucket-999" #can comment name to get a generated one 

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
