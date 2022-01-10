resource "aws_network_interface" "interface" {
  count           = var.create_network_interface ? var.interface_count : 0
  subnet_id       = aws_subnet.public[count.index].id
  private_ips     = ["10.0.0.50"]
  security_groups = [aws_security_group.sg.id]
}

resource "aws_network_interface_attachment" "attach" {
  count                = var.create_network_interface ? var.interface_count : 0
  instance_id          = ""
  network_interface_id = aws_network_interface.interface[count.index].id
  device_index         = 0
}

resource "aws_eip" "eip" {
  count = var.create_eip ? var.eip_count : 0
  # instance = ""
  vpc = true
}

resource "aws_eip_association" "eip_association" {
  count = var.create_eip ? var.eip_count : 0
  # instance_id       = ""
  allocation_id = aws_eip.eip[count.index].id
  # network_interface = ""
  # vpc               = ""

  # tags = {
  #   name = "public EIP"
  # }
}