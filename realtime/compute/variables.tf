variable "public_subnet_id" {}

# variable "private_subnet_id" {}

variable "sg_id" {}

variable "instance_count" {
  type    = number
  default = 1
}

variable "instance_type" {
  type        = string
  description = "Instance type to be used for VM creattion"
  default     = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "AMI to be used for VM creattion"
  default     = "ami-052cef05d01020f1d"
}

variable "instance_launch_template_name" {
  type    = string
  default = "ec2-launch-template"
}

variable "core_count" {
  type    = number
  default = 4
}

variable "threads_per_core" {
  type    = number
  default = 2
}

variable "cpu_credits" {
  type    = string
  default = "standard"
}

variable "http_endpoint" {
  type    = string
  default = "enabled"
}

variable "http_tokens" {
  type    = string
  default = "required"
}

variable "http_put_response_hop_limit" {
  type    = number
  default = 1
}

variable "enable_monitoring" {
  type    = bool
  default = true
}

variable "disable_api_termination" {
  type    = bool
  default = false
}

variable "instance_shutdown_behavior" {
  type    = string
  default = "terminate"
}

variable "ebs_optimized" {
  type    = bool
  default = false
}

variable "capacity_reservation_preference" {
  type    = string
  default = "none"
}

variable "default_version" {
  type    = bool
  default = true
}