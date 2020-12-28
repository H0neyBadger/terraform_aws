
variable "aws_vpc_dhcp_options_domain_name" {
  type = string
  default = null
}

variable "aws_vpc_dhcp_options_domain_name_servers" {
  type = list(string)
  default = null
}

variable "aws_vpc_dhcp_options_ntp_servers" {
  type = list(string)
  default = null
}

variable "aws_vpc_dhcp_options_netbios_name_servers" {
  type = list(string)
  default = null
}

variable "aws_vpc_dhcp_options_netbios_node_type" {
  type = number
  default = null
}

variable "aws_vpc_dhcp_options_name" {
  type = string
  default = "aws-vpc-dhcp-options"
}

variable "aws_vpc_dhcp_options_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

