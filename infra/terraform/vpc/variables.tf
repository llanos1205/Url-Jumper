variable "vpc_cidr" {
  type    = string
}
variable "subnets" {
  type = list(any)
}
variable "common_tags" {
  description = "Common tags you want applied to all components."
}

