# Functions to extract subnet mask to be used to create subnet
locals {
  vpc_subnet_mask = 16 - element(split("/", var.cidr_block), 1)
  subnet_mask     = 24 - element(split("/", var.cidr_block), 1)
}

# Used for creating security groups rules based on condition
locals {
  sg_ingress_rules = var.create_ingress_sg_rules ? var.ingress_sg_rules : {}
  sg_egress_rules  = var.create_egress_sg_rules ? var.egress_sg_rules : {}
}

# Used for creating network acl rules based on condition
locals {
  network_acl_ingress_rules = var.create_ingress_network_acl_rules ? var.ingress_network_acl_rules : {}
  network_acl_egress_rules  = var.create_egress_network_acl_rules ? var.egress_network_acl_rules : {}
}