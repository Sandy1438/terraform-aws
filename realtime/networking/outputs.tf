output "public_subnet_id" {
  description = "Exporting public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_id" {
  description = "Exporting private subnets"
  value       = aws_subnet.private[*].id
}

output "sg_id" {
  description = "Exporting security groups"
  value       = aws_security_group.sg.id
}

output "interface_id" {
  description = "Exporting network interface"
  value       = aws_network_interface.interface[*].id
}

output "eip_id" {
  description = "Exporting elastic ip"
  value       = aws_eip.eip[*].id
}

