
resource "aws_eip" "nat_gateway" {
  vpc = true
}
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = var.subnet_id
  tags = var.common_tags

}
