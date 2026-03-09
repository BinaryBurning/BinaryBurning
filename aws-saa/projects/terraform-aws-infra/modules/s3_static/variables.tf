variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket for static site hosting"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to resources"
}
