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

module "subnet" {
  source        = "./subnet"
  for_each      = { for subnet in var.subnets : subnet.suffix => subnet }
  subnet_ranges = each.value.range
  subnet_suffix = each.value.suffix
  vpcid         = aws_vpc.main.id
  common_tags   = var.common_tags
}
