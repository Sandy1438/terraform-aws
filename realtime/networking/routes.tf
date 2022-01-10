data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "example"
  }
}

resource "aws_route" "igw_route" {
  count                  = var.create_internet_gateway ? 1 : 0
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[count.index].id
  depends_on             = [aws_route_table.route_table]
}

resource "aws_route" "natgateway_route" {
  count                  = var.create_public_nat_gateway && var.create_public_subnet ? 1 : 0
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public[count.index].id
  depends_on             = [aws_route_table.route_table]
}

resource "aws_route_table_association" "public_subnet" {
  count          = var.create_internet_gateway && var.create_public_subnet ? 1 : 0
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "private_subnet" {
  count          = var.create_public_nat_gateway && var.create_private_subnet ? 1 : 0
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = data.aws_vpc.default_vpc.main_route_table_id
}