variable "static_bucket_id" {
  type        = string
  description = "ID of the S3 bucket hosting the static site"
}

variable "logs_bucket_id" {
  type        = string
  description = "ID of the S3 bucket for CloudFront logs"
}

variable "tags" {
  type    = map(string)
  default = {}
}
