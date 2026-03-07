# modules {
module "vpc" {
  source = "./modules/vpc"

  cidr_block      = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

# module "s3" {
#   source = "./modules/s3"
# }

# module "compute" {
#   source = "./modules/compute"
# }


# }
