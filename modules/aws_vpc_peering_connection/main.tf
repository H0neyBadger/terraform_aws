
locals {
  accepter_exists = anytrue([
    var.aws_vpc_peering_connection_accepter_allow_vpc_to_remote_classic_link,
    var.aws_vpc_peering_connection_accepter_allow_classic_link_to_remote_vpc,
    var.aws_vpc_peering_connection_accepter_allow_remote_vpc_dns_resolution,
  ])

  requester_exists = anytrue([
    var.aws_vpc_peering_connection_requester_allow_vpc_to_remote_classic_link,
    var.aws_vpc_peering_connection_requester_allow_classic_link_to_remote_vpc,
    var.aws_vpc_peering_connection_requester_allow_remote_vpc_dns_resolution,
  ])
}

resource "aws_vpc_peering_connection" "vpc_peering_connection" {
  vpc_id        = var.aws_vpc_peering_connection_vpc_id
  peer_vpc_id   = var.aws_vpc_peering_connection_peer_vpc_id
  peer_owner_id = var.aws_vpc_peering_connection_peer_owner_id
  peer_region   = var.aws_vpc_peering_connection_peer_region
  auto_accept   = var.aws_vpc_peering_connection_auto_accept

  dynamic "accepter" {
    for_each = local.accepter_exists == true ? [1] : []
    content {
      allow_vpc_to_remote_classic_link = var.aws_vpc_peering_connection_accepter_allow_vpc_to_remote_classic_link
      allow_classic_link_to_remote_vpc = var.aws_vpc_peering_connection_accepter_allow_classic_link_to_remote_vpc
      allow_remote_vpc_dns_resolution  = var.aws_vpc_peering_connection_accepter_allow_remote_vpc_dns_resolution
    }
  }

  dynamic "requester" {
    for_each = local.requester_exists == true ? [1] : []
    content {
      allow_vpc_to_remote_classic_link = var.aws_vpc_peering_connection_requester_allow_vpc_to_remote_classic_link
      allow_classic_link_to_remote_vpc = var.aws_vpc_peering_connection_requester_allow_classic_link_to_remote_vpc
      allow_remote_vpc_dns_resolution  = var.aws_vpc_peering_connection_requester_allow_remote_vpc_dns_resolution
    }
  }

  tags = merge(
    {
      "Name" = format("%s", var.aws_vpc_peering_connection_name)
    },
    var.tags,
    var.aws_vpc_peering_connection_tags,
  )
}

