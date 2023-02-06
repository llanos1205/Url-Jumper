module "root-bucket" {
  count       = var.root ? 1 : 0
  source      = "../../modules/s3"
  domain_name = var.s3_domain_name
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
  subdomain_name = var.s3_subdomain_name
  root           = true
}

module "www-bucket" {

  source      = "../../modules/s3"
  domain_name = var.s3_domain_name
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
  subdomain_name = var.s3_subdomain_name
  root           = false
}



module "cloudfront" {
  source                  = "../../modules/CloudFront"
  s3_domain_name          = var.s3_domain_name
  s3_subdomain_name       = var.s3_subdomain_name
  s3_www_website_endpoint = module.www-bucket.s3_www_website_endpoint
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
}

module "route53_client" {
  source      = "../../modules/Route53"
  domain_name = var.s3_domain_name
  url         = module.www-bucket.s3_name
  alias_name  = module.cloudfront.www_dist_domain_name
  zone_id     = module.cloudfront.www_dist_zone_id
  type        = "A"
}
