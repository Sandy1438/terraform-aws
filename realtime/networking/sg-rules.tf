variable "ingress_sg_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    create_rule = bool

  }))
  default = {
    "22_ssh" = {
      from_port   = 22
      to_port     = "22"
      protocol    = "tcp"
      create_rule = false
    }
    "80_http" = {
      from_port   = 80
      to_port     = "80"
      protocol    = "tcp"
      create_rule = true
    }
    "443_https" = {
      from_port   = 443
      to_port     = "443"
      protocol    = "tcp"
      create_rule = true
    }
  }
}

variable "egress_sg_rules" {
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    create_rule = bool
  }))
  default = {
    # This will allow all traffic from vm to internet
    "allow_ALL" = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      create_rule = true
    }
  }
}