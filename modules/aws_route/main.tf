
resource "aws_route" "route" {
  route_table_id = var.aws_route_route_table_id

  destination_cidr_block = var.aws_route_destination_cidr_block
  destination_ipv6_cidr_block = var.aws_route_destination_ipv6_cidr_block

  # egress_only_gateway_id - (Optional) Identifier of a VPC Egress Only Internet Gateway.
  egress_only_gateway_id = var.aws_route_egress_only_gateway_id
  # gateway_id - (Optional) Identifier of a VPC internet gateway or a virtual private gateway.
  gateway_id = var.aws_route_gateway_id
  # instance_id - (Optional) Identifier of an EC2 instance.
  instance_id = var.aws_route_instance_id
  # nat_gateway_id - (Optional) Identifier of a VPC NAT gateway.
  nat_gateway_id = var.aws_route_nat_gateway_id
  # local_gateway_id - (Optional) Identifier of a Outpost local gateway.
  local_gateway_id = var.aws_route_local_gateway_id
  # network_interface_id - (Optional) Identifier of an EC2 network interface.
  network_interface_id = var.aws_route_network_interface_id
  # transit_gateway_id - (Optional) Identifier of an EC2 Transit Gateway.
  transit_gateway_id = var.aws_route_transit_gateway_id
  # vpc_endpoint_id - (Optional) Identifier of a VPC Endpoint.
  vpc_endpoint_id = var.aws_route_vpc_endpoint_id
  # vpc_peering_connection_id - (Optional) Identifier of a VPC peering connection.
  vpc_peering_connection_id = var.aws_route_vpc_peering_connection_id

}

