provider "aws" {
  region     = "ap-south-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "devops-tf-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

variable "instance_count" {
  type    = number
  default = 1
}

module "vpc" {
  source                           = "./realtime/networking"
  cidr_block                       = "172.0.0.0/16"
  subnet_count                     = 2
  eip_count                        = 1
  interface_count                  = 1
  public_nat_gateway_count         = 1
  private_nat_gateway_count        = 1
  igw_count                        = 1
  sg_name                          = "Devops-sg"
  create_public_subnet             = true
  create_private_subnet            = false
  public_ip_on_public_subnet       = false
  public_ip_on_private_subnet      = false
  create_private_nat_gateway       = false
  create_public_nat_gateway        = false
  create_internet_gateway          = false
  create_network_interface         = false
  create_eip                       = false
  create_ingress_sg_rules          = false
  create_egress_sg_rules           = false
  create_ingress_network_acl_rules = false
  create_egress_network_acl_rules  = false
  create_network_acl               = false
}

module "ec2" {
  count = var.instance_count
  source          = "./realtime/compute"
  instance_count  = var.instance_count
  public_subnet_id       = module.vpc.public_subnet_id[count.index]
  sg_id = module.vpc.*.sg_id
}
