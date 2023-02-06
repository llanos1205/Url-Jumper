variable "subnet_suffix" {
  type = string
}
variable "subnet_ranges" {
  type = list(any)
}
variable "vpcid" {
  type = string
}
variable "common_tags" {
  description = "Common tags you want applied to all components."
}
