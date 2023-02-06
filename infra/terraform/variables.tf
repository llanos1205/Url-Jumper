variable "tf_environment" {
  type = string
}

variable "s3_domain_name" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "vpc_subnets_public" {
  type = list(any)
}
variable "vpc_subnets_private" {
  type = list(any)
}
variable "root" {
  description = "if root bucket is needed"
  default     = false
}
variable "s3_subdomain_name" {
  type        = string
  description = "The domain name for the website."
}
