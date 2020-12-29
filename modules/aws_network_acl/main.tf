
resource "aws_network_acl" "network_acl" {
  vpc_id = var.aws_network_acl_vpc_id
  subnet_ids  = var.aws_network_acl_subnet_ids

  dynamic "ingress" {
    for_each = var.aws_network_acl_ingress
    iterator = each
    content {
      rule_no         = each.value.rule_no == null ? index(var.aws_network_acl_ingress, each.value) : each.value.rule_no
      action          = each.value.action == null ? "allow" : each.value.action
      protocol        = each.value.protocol == null ? "tcp" : each.value.protocol
      from_port       = each.value.from_port == null ? each.value.port : each.value.from_port
      to_port         = each.value.to_port == null ? each.value.port : each.value.to_port
      cidr_block      = each.value.cidr_block
      ipv6_cidr_block = each.value.ipv6_cidr_block
      icmp_type       = each.value.icmp_type
      icmp_code       = each.value.icmp_code
    }
  }

  dynamic "egress" {
    for_each = var.aws_network_acl_egress
    iterator = each
    content {
      rule_no         = each.value.rule_no == null ? index(var.aws_network_acl_ingress, each.value) : each.value.rule_no
      action          = each.value.action == null ? "allow" : each.value.action
      protocol        = each.value.protocol == null ? "tcp" : each.value.protocol
      from_port       = each.value.from_port == null ? each.value.port : each.value.from_port
      to_port         = each.value.to_port == null ? each.value.port : each.value.to_port
      cidr_block      = each.value.cidr_block
      ipv6_cidr_block = each.value.ipv6_cidr_block
      icmp_type       = each.value.icmp_type
      icmp_code       = each.value.icmp_code
    }
  }

  tags = merge(
    {
      "Name" = format("%s", var.aws_network_acl_name)
    },
    var.tags,
    var.aws_network_acl_tags,
  )
}

