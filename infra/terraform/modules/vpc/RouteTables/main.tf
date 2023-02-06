resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.natgw_id
  }

  tags = {
    Name = "example"
  }
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.foo.id
  route_table_id = aws_route_table.bar.id
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "example"
  }
}
resource "aws_route_table_association" "public" {
  gateway_id     = aws_internet_gateway.foo.id
  route_table_id = aws_route_table.bar.id
}