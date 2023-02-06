# module "fronet_end" {
#   source            = "./components/front-end"
#   tf_environment    = var.tf_environment
#   s3_domain_name    = var.s3_domain_name
#   s3_subdomain_name = var.s3_subdomain_name
#   root     = var.root
# }

module "back_end" {
  source          = "./components/back-end"
  vpc_cidr        = var.vpc_cidr
  vpc_subnets_private = var.vpc_subnets_private
  vpc_subnets_public  = var.vpc_subnets_public
  tf_environment  = var.tf_environment

}
