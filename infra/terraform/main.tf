module "fronet_end" {
  source            = "./components/front-end"
  tf_environment    = var.tf_environment
  s3_domain_name    = var.domain_name
  s3_subdomain_name = var.s3_subdomain_name
  root              = var.root
}

# module "back_end" {
#   source              = "./components/back-end"
#   vpc_cidr            = var.vpc_cidr
#   vpc_name            = var.vpc_name
#   vpc_subnets_private = var.vpc_subnets_private
#   vpc_subnets_public  = var.vpc_subnets_public
#   tf_environment      = var.tf_environment
#   ebsk_desc           = var.ebsk_desc
#   ebsk_instance_type  = var.ebsk_instance_type
#   ebsk_max_instances  = var.ebsk_max_instances
#   ebsk_min_instances  = var.ebsk_min_instances
#   ebsk_name           = var.ebsk_name
#   sg_internal_rules   = var.sg_internal_rules
#   sg_elb_rules        = var.sg_internal_rules
#   domain_name         = var.domain_name
#   ebsk_subdomain_name = var.ebsk_subdomain_name
# }
