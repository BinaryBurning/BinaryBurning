output "cloudfront_domain" {
  value = aws_cloudfront_distribution.cdn.domain_name
}

output "distribution_arn" {
  value = aws_cloudfront_distribution.cdn.arn
}

output "oac_arn" {
  value = aws_cloudfront_origin_access_control.oac.arn
}
