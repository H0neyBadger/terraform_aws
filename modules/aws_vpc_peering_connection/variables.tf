
variable "aws_vpc_peering_connection_vpc_id" {
  type = string
}

variable "aws_vpc_peering_connection_peer_vpc_id" {
  type = string
}

variable "aws_vpc_peering_connection_peer_owner_id" {
  type = string
  default = null
}

variable "aws_vpc_peering_connection_peer_region" {
  type = string
  default = null
}

variable "aws_vpc_peering_connection_auto_accept" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_accepter_allow_vpc_to_remote_classic_link" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_accepter_allow_classic_link_to_remote_vpc" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_accepter_allow_remote_vpc_dns_resolution" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_requester_allow_vpc_to_remote_classic_link" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_requester_allow_classic_link_to_remote_vpc" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_requester_allow_remote_vpc_dns_resolution" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_name" {
  type = string
  default = "aws-vpc-peering-connection"
}

variable "aws_vpc_peering_connection_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

