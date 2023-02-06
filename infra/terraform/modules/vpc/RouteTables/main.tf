
resource "aws_route_table" "table" {
  vpc_id = var.vpc_id
  dynamic "route" {
    for_each = toset(var.igw_id != "" ? ["token"] : [])
    content {
      cidr_block = "0.0.0.0/0"
      gateway_id = var.igw_id
    }
  }
  dynamic "route" {
    for_each = toset(var.nat_id != "" ? ["token"] : [])
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = var.nat_id
    }
  }
}
resource "aws_route_table_association" "private" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.table.id
}



# resource "aws_route_table_association" "public" {
#   gateway_id     = aws_internet_gateway.foo.id
#   route_table_id = aws_route_table.bar.id
# }
