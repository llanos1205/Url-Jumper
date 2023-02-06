resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  #azs                  = slice(data.aws_availability_zones.available.names, 0, 3)
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(
    var.common_tags,
    {
      "Name" : "Url-Jumper"
    }
  )
}

module "subnet-public" {
  source        = "./subnet"
  for_each      = { for subnet in var.public_subnets : subnet.id => subnet }
  cidr          = each.value.cidr
  az            = each.value.az
  id            = each.value.id
  subnet_suffix = "public"
  vpcid         = aws_vpc.main.id
  common_tags   = var.common_tags
}

module "subnet-private" {
  source        = "./subnet"
  for_each      = { for subnet in var.private_subnets : subnet.id => subnet }
  cidr          = each.value.cidr
  az            = each.value.az
  id            = each.value.id
  subnet_suffix = "private"
  vpcid         = aws_vpc.main.id
  common_tags   = var.common_tags
}


module "igw" {
  source      = "./IGW"
  vpc_id      = aws_vpc.main.id
  common_tags = var.common_tags
}

module "NAT" {
  source      = "./NatGW"
  for_each    = module.subnet-private
  subnet_id   = each.value.subnet_id
  common_tags = var.common_tags

}

module "Private-RT" {
  source      = "./RouteTables"
  count       = length(module.subnet-private)
  subnet_id   = module.subnet-private["0${count.index+1}"].subnet_id
  nat_id      = module.NAT["0${count.index+1}"].nat_id
  igw_id      = ""
  vpc_id      = aws_vpc.main.id
  common_tags = var.common_tags
}

module "Public-RT" {
  source      = "./RouteTables"
  vpc_id      = aws_vpc.main.id
  count       = length(module.subnet-public)
  subnet_id   = module.subnet-public["0${count.index+1}"].subnet_id
  nat_id      = ""
  igw_id      = module.igw.igw_id
  common_tags = var.common_tags
}
