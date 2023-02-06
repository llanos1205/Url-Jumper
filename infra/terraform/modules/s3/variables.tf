variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "subdomain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}
variable "root" {
  description = "if root bucket is needed"
  default = false
}
