provider "aws" {
  region     = "us-east-1"
}
module "www-bucket" {
  source = "./s3"
  domain_name = "llanoscorp.com"
  bucket_name = "llanoscorp.com"
  common_tags = {
    Project = "llanoscorp"
  }
}