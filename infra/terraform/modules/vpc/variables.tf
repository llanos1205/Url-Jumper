variable "vpc_cidr" {
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

