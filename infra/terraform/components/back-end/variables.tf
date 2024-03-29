variable "vpc_cidr" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "vpc_subnets_public" {
  type = list(any)
}
variable "vpc_subnets_private" {
  type = list(any)
}
variable "tf_environment" {
  type = string
}
variable "ebsk_name" {
  type = string
}
variable "ebsk_desc" {
  type = string
}
variable "ebsk_instance_type" {
  type = string
}
variable "ebsk_min_instances" {
  type = string
}
variable "ebsk_max_instances" {
  type = string
}
variable "sg_internal_rules" {
  type = any
}
variable "sg_elb_rules" {
  type = any
}
variable "domain_name" {
  type = string
}
variable "ebsk_subdomain_name" {
  type = string
}
