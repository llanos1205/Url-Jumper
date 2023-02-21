module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.vpc_subnets_private
  public_subnets  = var.vpc_subnets_public
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
}

# module "ebsk" {
#   source           = "../../modules/EBSK"
#   vpc_id           = module.vpc.vpc_id
#   application_name = var.ebsk_name
#   application_desc = var.ebsk_desc
#   private_subnets  = module.vpc.private_subnets
#   public_subnets   = module.vpc.public_subnets
#   instance_type    = var.ebsk_instance_type
#   min_instances    = var.ebsk_min_instances
#   max_instances    = var.ebsk_max_instances

# }
