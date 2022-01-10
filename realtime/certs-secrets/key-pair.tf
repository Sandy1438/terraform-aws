resource "aws_key_pair" "devops_pub_key" {
  key_name   = "devops-key"
  public_key = file("../../.ssh/devops_civo_private_key.pub")
}

data "aws_key_pair" "devops_pub_key" {
  key_name = "devops-key"
}

output "devop_pub_key" {
  value = data.aws_key_pair.devops_pub_key.key_name
}

output "devops_pub_key" {
  value = aws_key_pair.devops_pub_key.key_name
}