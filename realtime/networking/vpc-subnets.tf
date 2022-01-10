# data "aws_availability_zones" "az" {
#   state = "available"
# }

data "aws_availability_zones" "az" {}
resource "aws_vpc" "vpc" {
  cidr_block = cidrsubnet(var.cidr_block, local.vpc_subnet_mask, 0)
  # instance_tenancy     = ""
  enable_dns_hostnames = "true"

  tags = {
    Name = "Devops-Privte-vpc"
  }
}

resource "aws_subnet" "private" {
  count = var.create_private_subnet ? var.subnet_count : 0
  # vpc_id            = flatten(aws_vpc.vpc[count.index].id)[count.index]
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, local.subnet_mask, count.index + 1)
  availability_zone       = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = var.public_ip_on_public_subnet

  tags = {
    Name = "Devops-Privte-Subnet"
  }
}

resource "aws_subnet" "public" {
  count = var.create_public_subnet ? var.subnet_count : 0
  # vpc_id            = flatten(aws_vpc.vpc[count.index].id)[count.index]
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, local.subnet_mask, count.index + 4)
  availability_zone = data.aws_availability_zones.az.names[count.index]
  # availability_zone_id = ""
  map_public_ip_on_launch = var.public_ip_on_private_subnet

  tags = {
    Name = "Devops-Public-Subnet"
  }
}