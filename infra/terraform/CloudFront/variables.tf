variable "s3_www_website_endpoint" {
  type        = string
}
variable "s3_www_bucket_name" {
  type        = string
}
variable "s3_domain_name" {
  type        = string
}
variable "s3_root_website_endpoint" {
  type        = string
}
variable "s3_root_bucket_name" {
  type        = string
}
variable "common_tags" {
  description = "Common tags you want applied to all components."
}

