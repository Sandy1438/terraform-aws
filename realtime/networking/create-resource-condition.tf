variable "create_public_subnet" {
  type    = bool
  default = false
}

variable "create_private_subnet" {
  type    = bool
  default = true
}
variable "public_ip_on_public_subnet" {
  type    = bool
  default = true
}

variable "public_ip_on_private_subnet" {
  type    = bool
  default = true
}

variable "create_private_nat_gateway" {
  type    = bool
  default = false
}

variable "create_public_nat_gateway" {
  type    = bool
  default = true
}

variable "create_internet_gateway" {
  type    = bool
  default = true
}

variable "create_network_interface" {
  type    = bool
  default = false
}

variable "create_eip" {
  type    = bool
  default = true
}

variable "create_ingress_sg_rules" {
  type    = bool
  default = false
}

variable "create_egress_sg_rules" {
  type    = bool
  default = false
}

variable "create_ingress_network_acl_rules" {
  type    = bool
  default = false
}

variable "create_egress_network_acl_rules" {
  type    = bool
  default = false
}

variable "create_network_acl" {
  type    = bool
  default = false
}