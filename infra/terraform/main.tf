provider "aws" {
  region = "us-east-1"
}


# module "www-bucket" {
#   source      = "./s3"
#   domain_name = var.s3_domain_name
#   bucket_name = var.s3_bucket_name
#   common_tags = {
#     Project     = "url-jumper"
#     Environment = var.tf_environment
#   }
# }

# module "cloudfront" {
#   source                   = "./CloudFront"
#   s3_domain_name           = var.s3_domain_name
#   s3_root_bucket_name      = var.s3_bucket_name
#   s3_www_bucket_name       = var.s3_bucket_name
#   s3_www_website_endpoint  = module.www-bucket.s3_www_website_endpoint
#   s3_root_website_endpoint = module.www-bucket.s3_root_website_endpoint
#   common_tags = {
#     Project     = "url-jumper"
#     Environment = var.tf_environment
#   }
# }

# module "route53_client" {
#   source                              = "./Route53"
#   domain_name                         = var.s3_domain_name
#   root_s3_distribution_domain_name    = module.cloudfront.root_dist_domain_name
#   root_s3_distribution_hosted_zone_id = module.cloudfront.root_dist_zone_id
#   www_s3_distribution_domain_name     = module.cloudfront.www_dist_domain_name
#   www_s3_distribution_hosted_zone_id  = module.cloudfront.www_dist_zone_id
#   
# }

module "vpc" {
  source   = "./vpc"
  vpc_cidr = var.vpc_cidr
  subnets  = var.vpc_subnets
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
}
