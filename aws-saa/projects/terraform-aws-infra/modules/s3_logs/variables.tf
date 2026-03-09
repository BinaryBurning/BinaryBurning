variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket for logs"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to resources"
}
