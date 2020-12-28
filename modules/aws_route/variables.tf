
variable "aws_route_route_table_id" {
  type = string
}

variable "aws_route_destination_cidr_block" {
  type = string
  default = null
}

variable "aws_route_destination_ipv6_cidr_block" {
  type = string
  default = null
}

variable "aws_route_egress_only_gateway_id" {
  description = "(Optional) Identifier of a VPC Egress Only Internet Gateway."
  type = string
  default = null
}

variable "aws_route_gateway_id" {
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway."
  type = string
  default = null
}

variable "aws_route_instance_id" {
  description = "(Optional) Identifier of an EC2 instance."
  type = string
  default = null
}

variable "aws_route_nat_gateway_id" {
  description = "(Optional) Identifier of a VPC NAT gateway."
  type = string
  default = null
}

variable "aws_route_local_gateway_id" {
  description = "(Optional) Identifier of a Outpost local gateway."
  type = string
  default = null
}

variable "aws_route_network_interface_id" {
  description = "(Optional) Identifier of an EC2 network interface."
  type = string
  default = null
}

variable "aws_route_transit_gateway_id" {
  description = "(Optional) Identifier of an EC2 Transit Gateway."
  type = string
  default = null
}

variable "aws_route_vpc_endpoint_id" {
  description = "(Optional) Identifier of a VPC Endpoint."
  type = string
  default = null
}

variable "aws_route_vpc_peering_connection_id" {
  description = "(Optional) Identifier of a VPC peering connection."
  type = string
  default = null
}

