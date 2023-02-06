module "root-bucket" {
  count = var.root ? 1: 0
  source      = "../../modules/s3"
  domain_name = var.s3_domain_name
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
  subdomain_name = var.s3_subdomain_name
  root = true
}

module "www-bucket" {

  source      = "../../modules/s3"
  domain_name = var.s3_domain_name
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
  subdomain_name = var.s3_subdomain_name
  root = false
}



# module "cloudfront" {
#   source                   = "../../modules/CloudFront"
#   s3_domain_name           = var.s3_domain_name
#   s3_root_bucket_name      = var.s3_bucket_name
#   s3_www_bucket_name       = var.s3_bucket_name
#   s3_www_website_endpoint  = module.www-bucket.s3_www_website_endpoint
#   s3_root_website_endpoint = module.root-bucket.s3_root_website_endpoint
#   common_tags = {
#     Project     = "url-jumper"
#     Environment = var.tf_environment
#   }
# }

# module "route53_client" {
#   source                              = "../../modules/Route53"
#   domain_name                         = var.s3_domain_name
#   root_s3_distribution_domain_name    = module.cloudfront.root_dist_domain_name
#   root_s3_distribution_hosted_zone_id = module.cloudfront.root_dist_zone_id
#   www_s3_distribution_domain_name     = module.cloudfront.www_dist_domain_name
#   www_s3_distribution_hosted_zone_id  = module.cloudfront.www_dist_zone_id
#   common_tags = {
#     Project     = "url-jumper"
#     Environment = var.tf_environment
#   }
  
# }