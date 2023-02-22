variable "tf_environment" {
  type = string
}
variable "vpc_name" {
  type    = string
}

variable "domain_name" {
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

variable "ebsk_desc" {
  type = string
}

variable "ebsk_instance_type" {
  type = string
}

variable "ebsk_max_instances" {
  type = string
}
variable "ebsk_min_instances" {
  type = string
}
variable "ebsk_name" {
  type = string
}
variable "sg_internal_rules" {
}
variable "sg_elb_rules" {
}
variable "ebsk_subdomain_name" {
  type = string
}
