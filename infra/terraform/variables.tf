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
variable "vpc_subnets" {
  type = list(any)
}
