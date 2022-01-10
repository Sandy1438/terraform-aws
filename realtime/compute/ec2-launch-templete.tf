
resource "aws_launch_template" "ec2_config_details" {
  name = var.instance_launch_template_name

  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }

  # cpu_options {
  #   core_count       = var.core_count
  #   threads_per_core = var.threads_per_core
  # }

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  update_default_version = var.default_version

  disable_api_termination = var.disable_api_termination

  ebs_optimized = var.ebs_optimized

  image_id = var.ami_id

  instance_initiated_shutdown_behavior = var.instance_shutdown_behavior

  instance_type = var.instance_type

  metadata_options {
    http_endpoint               = var.http_endpoint
    http_tokens                 = var.http_tokens
    http_put_response_hop_limit = var.http_put_response_hop_limit
  }

  monitoring {
    enabled = var.enable_monitoring
  }

  # vpc_security_group_ids = ["sg-12345678"]

  # network_interfaces {
  #   associate_public_ip_address = true
  # }

  #     ebs {
  #       volume_size = 20
  #     }
  #   }

  #   block_device_mappings {
  #     device_name = "/dev/sda1"

  #   elastic_gpu_specifications {
  #     type = "test"
  #   }

  #   elastic_inference_accelerator {
  #     type = "eia1.medium"
  #   }

  #   iam_instance_profile {
  #     name = "test"
  #   }

  #   instance_market_options {
  #     market_type = "spot"
  #   }

  #   kernel_id = "test"

  #   key_name = "test"

  #   license_specification {
  #     license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  #   }

  #   placement {
  #     availability_zone = "us-west-2a"
  #   }

  #   ram_disk_id = "test"

  # tag_specifications {
  #   resource_type = "instance"

  #   tags = {
  #     Name = "test"
  #   }
  # }

  #   user_data = filebase64("${path.module}/example.sh")
}

# data "aws_ami" "ubuntu_20_04_lts" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#   # owners = ["099720109477"] # Canonical
# }
