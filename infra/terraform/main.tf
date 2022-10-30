provider "aws" {
  region = "us-east-1"
}
module "www-bucket" {
  source         = "./s3"
  domain_name    = var.s3_domain_name
  bucket_name    = var.s3_bucket_name
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
}

module "cloudfront" {
  source = "./CloudFront"
  s3_domain_name = var.s3_domain_name
  s3_root_bucket_name = var.s3_bucket_name
  s3_www_bucket_name = var.s3_bucket_name
  s3_www_website_endpoint = module.www-bucket.s3_www_website_endpoint
  s3_root_website_endpoint = module.www-bucket.s3_root_website_endpoint
  common_tags = {
    Project     = "url-jumper"
    Environment = var.tf_environment
  }
}
