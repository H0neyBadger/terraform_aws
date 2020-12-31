
resource "aws_vpc_peering_connection_accepter" "vpc_peering_connection_accepter" {
  vpc_peering_connection_id = var.aws_vpc_peering_connection_accepter_vpc_peering_connection_id
  auto_accept               = var.aws_vpc_peering_connection_accepter_auto_accept

  tags = merge(
    {
      "Name" = format("%s", var.aws_vpc_peering_connection_accepter_name)
    },
    var.tags,
    var.aws_vpc_peering_connection_accepter_tags,
  )
}

