
variable "common_tags" {
  description = "Common tags you want applied to all components."
}
variable "sg_name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "ingresses" {
  type = list(any)
}
variable "egresses" {
  type = list(any)
}
