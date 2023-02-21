output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets" {
  value = values(module.subnet-private)[*].subnet_id
}

output "public_subnets" {
  value = values(module.subnet-public)[*].subnet_id
}
