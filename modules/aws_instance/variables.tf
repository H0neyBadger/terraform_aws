
variable "aws_ami_executable_users" {
  type = list(string)
  default = null
}

variable "aws_ami_most_recent" {
  type = bool
  default = true
}

variable "aws_ami_name_regex" {
  type = string
  default = null
}

variable "aws_ami_owners" {
  type = list(number)
  default = null
}

variable "aws_ami_filters" {
  type = list(object({
    name   = string
    values = list(string)
  }))
  default = []
}

variable "aws_instance_count" {
  type = number
  default = 1
}

variable "aws_instance_instance_type" {
  type = string
  default = "t2.micro"
}

variable "aws_instance_vpc_security_group_ids" {
  type = list(string)
  default = null
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#network-interfaces
# Each of the network_interface blocks attach a network interface to an
# EC2 Instance during boot time. However, because the network interface
# is attached at boot-time, replacing/modifying the network interface
# WILL trigger a recreation of the EC2 Instance.
variable "aws_instance_network_interfaces" {
  type = list(object({
    device_index       = number
    subnet_id          = string
    security_groups    = optional(list(string))
    ipv6_address_count = optional(number)
    private_ips_count  = optional(number)
  }))
  default = []
}

variable "aws_instance_name" {
  type = string
  default = "aws-instance"
}

variable "aws_instance_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

