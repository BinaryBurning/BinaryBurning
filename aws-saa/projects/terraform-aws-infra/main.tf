module "vpc" {
  source = "./modules/vpc"

  cidr_block     = var.cidr_block
  public_subnets = var.public_subnets
  # private_subnets = var.private_subnets

  public_azs = var.public_azs
}


module "s3_static" {
  source      = "./modules/s3_static"
  bucket_name = "binaryburning-static-site"
  tags = {
    Project = "AWS-SAA-Portfolio"
    Owner   = "Bilal"
  }
}

module "s3_logs" {
  source      = "./modules/s3_logs"
  bucket_name = "binaryburning-logs-bucket"
  tags = {
    Project = "AWS-SAA-Portfolio"
    Owner   = "Bilal"
  }
}

module "cloudfront" {
  source           = "./modules/cloudfront"
  static_bucket_id = module.s3_static.bucket_id
  logs_bucket_id   = module.s3_logs.bucket_id

  tags = {
    Project = "AWS-SAA-Portfolio"
    Owner   = "Bilal"
  }

  depends_on = [
    module.s3_logs
  ]
}

resource "aws_s3_bucket_policy" "static_policy" {
  bucket = module.s3_static.bucket_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontRead"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${module.s3_static.bucket_arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = module.cloudfront.distribution_arn
          }
        }
      }
    ]
  })
}

