resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group_rule" "sg-ingress-rules" {
  for_each          = { for k, v in local.sg_ingress_rules : k => v if local.sg_ingress_rules[k].create_rule }
  description       = "HTTP from VPC"
  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [aws_vpc.vpc.cidr_block]
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "sg-egress-rules" {
  for_each          = { for k, v in local.sg_egress_rules : k => v if local.sg_egress_rules[k].create_rule }
  description       = "TLS for VPC"
  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = [aws_vpc.vpc.cidr_block]
  security_group_id = aws_security_group.sg.id
}