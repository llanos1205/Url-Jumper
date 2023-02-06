variable "igw_id" {
  type = string
}
variable "nat_id" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "vpc_id" {
  type = string
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}
