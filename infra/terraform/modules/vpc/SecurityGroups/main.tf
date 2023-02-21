resource "aws_subnet" "subnet" {
  vpc_id            = var.vpcid
  cidr_block        = var.cidr
  availability_zone = var.az
  tags = merge(
    var.common_tags,
    { "Name" : "${var.subnet_suffix}-${var.id}" }
  )

}
