module "vpc" {
  source   = "./vpc"
  vpc_cidr = var.vpc_cidr
  subnets  = var.vpc_subnets
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
}
