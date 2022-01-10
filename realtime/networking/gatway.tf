resource "aws_internet_gateway" "igw" {
  count  = var.create_internet_gateway ? var.igw_count : 0
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "public IGW"
  }
}

resource "aws_nat_gateway" "public" {
  count             = var.create_eip && var.create_public_subnet ? var.public_nat_gateway_count : 0
  allocation_id     = aws_eip.eip[count.index].id
  subnet_id         = aws_subnet.public[count.index].id
  connectivity_type = "public"

  tags = {
    Name = "public NAT"
  }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "private" {
  count             = var.create_private_nat_gateway && var.create_private_subnet ? var.private_nat_gateway_count : 0
  subnet_id         = aws_subnet.private[count.index].id
  connectivity_type = "private"

  tags = {
    Name = "private NAT"
  }
}