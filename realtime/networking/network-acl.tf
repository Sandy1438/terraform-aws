resource "aws_network_acl" "network_acl" {
  count = var.create_network_acl ? 1 : 0
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.public[0].id, aws_subnet.private[0].id]

  dynamic "egress" {
    for_each = { for k, v in local.network_acl_egress_rules : k => v if local.network_acl_egress_rules[k].create_rule }
    content {
      protocol   = egress.value.protocol
      rule_no    = egress.value.rule_no
      action     = egress.value.action
      cidr_block = "10.3.0.0/18"
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
    }
  }

  dynamic "ingress" {
    for_each = { for k, v in local.network_acl_ingress_rules : k => v if local.network_acl_ingress_rules[k].create_rule }
    content {
      protocol   = ingress.value.protocol
      rule_no    = ingress.value.rule_no
      action     = ingress.value.action
      cidr_block = "10.3.0.0/18"
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
    }
  }

  tags = {
    Name = "main"
  }
}