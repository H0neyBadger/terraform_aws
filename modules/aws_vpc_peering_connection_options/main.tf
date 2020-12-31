
locals {
  accepter_exists = anytrue([
    var.aws_vpc_peering_connection_options_accepter_allow_vpc_to_remote_classic_link,
    var.aws_vpc_peering_connection_options_accepter_allow_classic_link_to_remote_vpc,
    var.aws_vpc_peering_connection_options_accepter_allow_remote_vpc_dns_resolution,
  ])

  requester_exists = anytrue([
    var.aws_vpc_peering_connection_options_requester_allow_vpc_to_remote_classic_link,
    var.aws_vpc_peering_connection_options_requester_allow_classic_link_to_remote_vpc,
    var.aws_vpc_peering_connection_options_requester_allow_remote_vpc_dns_resolution,
  ])
}

resource "aws_vpc_peering_connection_options" "vpc_peering_connection_options" {
  vpc_peering_connection_id = var.aws_vpc_peering_connection_options_vpc_peering_connection_id

  dynamic "accepter" {
    for_each = local.accepter_exists == true ? [1] : []
    content {
      allow_vpc_to_remote_classic_link = var.aws_vpc_peering_connection_options_accepter_allow_vpc_to_remote_classic_link
      allow_classic_link_to_remote_vpc = var.aws_vpc_peering_connection_options_accepter_allow_classic_link_to_remote_vpc
      allow_remote_vpc_dns_resolution  = var.aws_vpc_peering_connection_options_accepter_allow_remote_vpc_dns_resolution
    }
  }

  dynamic "requester" {
    for_each = local.requester_exists == true ? [1] : []
    content {
      allow_vpc_to_remote_classic_link = var.aws_vpc_peering_connection_options_requester_allow_vpc_to_remote_classic_link
      allow_classic_link_to_remote_vpc = var.aws_vpc_peering_connection_options_requester_allow_classic_link_to_remote_vpc
      allow_remote_vpc_dns_resolution  = var.aws_vpc_peering_connection_options_requester_allow_remote_vpc_dns_resolution
    }
  }

}

