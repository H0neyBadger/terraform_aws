
resource "aws_route_table" "route_table" {
  vpc_id     = var.aws_route_table_vpc_id

  dynamic "route" {
    for_each = var.aws_route_table_route
    iterator = each
    content {
      cidr_block                = each.value.cidr_block
      ipv6_cidr_block           = each.value.ipv6_cidr_block
      egress_only_gateway_id    = each.value.egress_only_gateway_id
      gateway_id                = each.value.gateway_id
      instance_id               = each.value.instance_id
      nat_gateway_id            = each.value.nat_gateway_id
      local_gateway_id          = each.value.local_gateway_id
      network_interface_id      = each.value.network_interface_id
      transit_gateway_id        = each.value.transit_gateway_id
      vpc_endpoint_id           = each.value.vpc_endpoint_id
      vpc_peering_connection_id = each.value.vpc_peering_connection_id
    }
  }

  tags = merge(
    {
      "name" = format("%s", var.aws_route_table_name)
    },
    var.tags,
    var.aws_route_table_tags,
  )
}

