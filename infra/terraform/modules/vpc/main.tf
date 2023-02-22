resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  #azs                  = slice(data.aws_availability_zones.available.names, 0, 3)
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(
    var.common_tags,
    {
      "Name" : "${var.vpc_name}-${var.tf_environment}"
    }
  )
}

module "subnet-public" {
  source        = "./Subnet"
  for_each      = { for subnet in var.public_subnets : subnet.id => subnet }
  cidr          = each.value.cidr
  az            = each.value.az
  id            = each.value.id
  subnet_suffix = "public-${var.tf_environment}"
  vpcid         = aws_vpc.main.id
  common_tags   = var.common_tags
}

module "subnet-private" {
  source         = "./Subnet"
  for_each       = { for subnet in var.private_subnets : subnet.id => subnet }
  cidr           = each.value.cidr
  az             = each.value.az
  id             = each.value.id
  subnet_suffix  = "private-${var.tf_environment}"
  vpcid          = aws_vpc.main.id
  common_tags    = var.common_tags
}


module "igw" {
  source = "./IGW"
  vpc_id = aws_vpc.main.id
  common_tags = merge(
    var.common_tags,
    { "Name" : "IGW-${var.tf_environment}" }
  )

}

module "NAT" {
  source    = "./NatGW"
  count     = length(module.subnet-public)
  subnet_id = module.subnet-public["0${count.index + 1}"].subnet_id
  common_tags = merge(
    var.common_tags,
    { "Name" : "NAT-${var.tf_environment}-${count.index + 1}" }
  )
}

module "Private-RT" {
  source     = "./RouteTables"
  count      = length(module.subnet-private)
  subnet_ids = ["${module.subnet-private["0${count.index + 1}"].subnet_id}"]
  nat_id     = module.NAT["0${count.index}"].nat_id
  igw_id     = ""
  vpc_id     = aws_vpc.main.id
  common_tags = merge(
    var.common_tags,
    { "Name" : "PrivateRT-${var.tf_environment}-${count.index + 1}" }
  )
}

module "Public-RT" {
  source     = "./RouteTables"
  vpc_id     = aws_vpc.main.id
  subnet_ids = values(module.subnet-public)[*].subnet_id
  nat_id     = ""
  igw_id     = module.igw.igw_id
  common_tags = merge(
    var.common_tags,
    { "Name" : "PublicRT-${var.tf_environment}" }
  )
}

module "Internal_SG" {
  source         = "./SecurityGroups"
  vpc_id         = aws_vpc.main.id
  ingresses      = var.sg_internal_rules["ingresses"]
  egresses       = var.sg_internal_rules["egresses"]
  sg_name        = "allow-all-internal-${var.tf_environment}"
  common_tags    = var.common_tags
}
