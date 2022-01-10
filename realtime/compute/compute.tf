resource "aws_key_pair" "devops_pub_key" {
  key_name   = "devops-key"
  public_key = file(".ssh/devops_civo_private_key.pub")
}

# data "aws_key_pair" "devops_pub_key" {
#   key_name = "devops-key"
# }

resource "aws_instance" "web" {
  count           = var.instance_count
  key_name        = aws_key_pair.devops_pub_key.key_name
#   security_groups = module.test.*.sg_id
#   subnet_id       = module.test.public_subnet_id[count.index]
  security_groups = var.sg_id
  subnet_id = var.public_subnet_id
  #   ebs_block_device = ""
  launch_template {
    id      = aws_launch_template.ec2_config_details.id
    version = aws_launch_template.ec2_config_details.latest_version
  }

  tags = {
    Name = "HelloWorld"
  }
}