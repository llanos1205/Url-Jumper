variable "vpc_cidr" {
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
