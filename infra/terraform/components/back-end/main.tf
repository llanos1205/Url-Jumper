module "vpc" {
  source            = "../../modules/vpc"
  vpc_cidr          = var.vpc_cidr
  vpc_name          = var.vpc_name
  private_subnets   = var.vpc_subnets_private
  public_subnets    = var.vpc_subnets_public
  sg_elb_rules      = var.sg_elb_rules
  sg_internal_rules = var.sg_internal_rules
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
  tf_environment = var.tf_environment
}

module "ebsk" {
  source           = "../../modules/EBSK"
  vpc_id           = module.vpc.vpc_id
  application_name = var.ebsk_name
  application_desc = var.ebsk_desc
  private_subnets  = module.vpc.private_subnets
  public_subnets   = module.vpc.public_subnets
  instance_type    = var.ebsk_instance_type
  min_instances    = var.ebsk_min_instances
  max_instances    = var.ebsk_max_instances
  security_groups  = [module.vpc.internal_sg_id]
  tf_environment   = var.tf_environment
  domain_name      = var.domain_name
}

module "route53_api" {
  source      = "../../modules/Route53"
  domain_name = var.domain_name
  url         = "${var.ebsk_subdomain_name}.${var.domain_name}"
  alias_name  = module.ebsk.ebsk_dns_name
  zone_id     = module.ebsk.ebsk_zone_id
  type        = "A"

}
