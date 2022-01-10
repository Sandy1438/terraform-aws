variable "ingress_network_acl_rules" {
  type = map(object({
    rule_no     = number
    action      = string
    from_port   = number
    to_port     = number
    protocol    = string
    create_rule = bool
  }))
  default = {
    "22_ssh" = {
      rule_no     = 100
      action      = "allow"
      from_port   = 80
      to_port     = "80"
      protocol    = "tcp"
      create_rule = false
    }
    "80_http" = {
      rule_no     = 200
      action      = "allow"
      from_port   = 80
      to_port     = "80"
      protocol    = "tcp"
      create_rule = false
    }
    "443_https" = {
      rule_no     = 300
      action      = "allow"
      from_port   = 443
      to_port     = "443"
      protocol    = "tcp"
      create_rule = false
    }
  }
}

variable "egress_network_acl_rules" {
  type = map(object({
    rule_no     = number
    action      = string
    from_port   = number
    to_port     = number
    protocol    = string
    create_rule = bool
  }))
  default = {
    "22_ssh" = {
      rule_no     = 100
      action      = "allow"
      from_port   = 80
      to_port     = "80"
      protocol    = "tcp"
      create_rule = false
    }
    "80_http" = {
      rule_no     = 200
      action      = "allow"
      from_port   = 80
      to_port     = "80"
      protocol    = "tcp"
      create_rule = false
    }
    "443_https" = {
      rule_no     = 300
      action      = "allow"
      from_port   = 443
      to_port     = "443"
      protocol    = "tcp"
      create_rule = false
    }
  }
}