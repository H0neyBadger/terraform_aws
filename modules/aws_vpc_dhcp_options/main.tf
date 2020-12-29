
resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  domain_name          = var.aws_vpc_dhcp_options_domain_name
  domain_name_servers  = var.aws_vpc_dhcp_options_domain_name_servers
  ntp_servers          = var.aws_vpc_dhcp_options_ntp_servers
  netbios_name_servers = var.aws_vpc_dhcp_options_netbios_name_servers
  netbios_node_type    = var.aws_vpc_dhcp_options_netbios_node_type

  tags = merge(
    {
      "Name" = format("%s", var.aws_vpc_dhcp_options_name)
    },
    var.tags,
    var.aws_vpc_dhcp_options_tags,
  )
}

