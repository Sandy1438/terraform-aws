
variable "subnet_count" {
  type    = number
  default = 1
}

variable "eip_count" {
  type    = number
  default = 1
}

variable "interface_count" {
  type    = number
  default = 1
}

variable "public_nat_gateway_count" {
  type    = number
  default = 1
}

variable "private_nat_gateway_count" {
  type    = number
  default = 1
}

variable "igw_count" {
  type    = number
  default = 1
}
variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "sg_name" {
  type    = string
  default = "Devops-sg"
}


