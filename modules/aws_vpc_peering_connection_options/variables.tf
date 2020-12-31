
variable "aws_vpc_peering_connection_options_vpc_peering_connection_id" {
  type = string
}

variable "aws_vpc_peering_connection_options_accepter_allow_vpc_to_remote_classic_link" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_options_accepter_allow_classic_link_to_remote_vpc" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_options_accepter_allow_remote_vpc_dns_resolution" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_options_requester_allow_vpc_to_remote_classic_link" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_options_requester_allow_classic_link_to_remote_vpc" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_options_requester_allow_remote_vpc_dns_resolution" {
  type = bool
  default = null
}

