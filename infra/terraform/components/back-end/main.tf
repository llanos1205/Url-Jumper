module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  private_subnets = var.vpc_subnets_private
  public_subnets  = var.vpc_subnets_public
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
}
