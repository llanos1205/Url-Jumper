resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_name
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = toset(var.ingresses)
    content {
      description = ingress.value["desc"]
      from_port   = ingress.value["source_port"]
      to_port     = ingress.value["dest_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidrs"]
    }
  }
  dynamic "egress" {
    for_each = toset(var.egresses)
    content {
      description = egress.value["desc"]
      from_port   = egress.value["source_port"]
      to_port     = egress.value["dest_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidrs"]
    }
  }
  tags = var.common_tags
}
