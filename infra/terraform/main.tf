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
