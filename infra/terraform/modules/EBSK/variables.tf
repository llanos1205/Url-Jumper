variable "application_name" {
  type = string
}

variable "application_desc" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "min_instances" {
  type = string
}

variable "max_instances" {
  type = string
}
