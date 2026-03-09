# module "vpc" {
#   source = "./modules/vpc"

#   cidr_block      = var.cidr_block
#   public_subnets  = var.public_subnets
#   private_subnets = var.private_subnets
# }

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
}



# module "s3" {
#   source = "./modules/s3"
# }

# module "compute" {
#   source = "./modules/compute"
# }


# }
