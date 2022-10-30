variable "tf_environment" {
  description = "Common tags you want applied to all components."
}

variable "s3_domain_name" {
  type = string
  description = "The domain name for the website."
}

variable "s3_bucket_name" {
  type = string
  description = "The name of the bucket without the sub-domain prefix. Normally domain_name."
}

