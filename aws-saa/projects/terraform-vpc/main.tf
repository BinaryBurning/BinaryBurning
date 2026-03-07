module "vpc" {
  source = "./modules/vpc"

  cidr_block      = var.cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

# module "s3" {
#   source = "./modules/s3"
# }

# module "compute" {
#   source = "./modules/compute"
# }


# }
