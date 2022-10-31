resource "aws_subnet" "subnet" {
  vpc_id            = var.vpcid
  for_each          = { for subnet in var.subnet_ranges : subnet.az => subnet }
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = merge(
    var.common_tags,
    { "Name" : "${var.subnet_suffix}-${each.value.id}" }
  )

}
