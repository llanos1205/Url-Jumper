variable "tf_environment" {
  type = string
}
variable "vpc_cidr" {
  type    = string
}
variable "vpc_name" {
  type    = string
}
variable "public_subnets" {
  type = list(any)
}
variable "private_subnets" {
  type = list(any)
}
variable "common_tags" {
  description = "Common tags you want applied to all components."
}
variable "sg_internal_rules" {
}
variable "sg_elb_rules" {
}

