
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "security_group" {
  name = var.aws_security_group_name
  description = var.aws_security_group_description
  vpc_id     = var.aws_security_group_vpc_id

  dynamic "ingress" {
    for_each = var.aws_security_group_ingress
    iterator = each
    content {
      from_port        = each.value.from_port == null ? each.value.port : each.value.from_port
      to_port          = each.value.to_port == null ? each.value.port : each.value.to_port
      protocol         = each.value.protocol == null ? "tcp" : each.value.protocol
      security_groups  = each.value.security_groups == null ? [] : each.value.security_groups
      cidr_blocks      = each.value.cidr_blocks == null ? [] : each.value.cidr_blocks
      ipv6_cidr_blocks = each.value.ipv6_cidr_blocks == null ? [] : each.value.ipv6_cidr_blocks
      prefix_list_ids  = each.value.prefix_list_ids == null ? [] : each.value.prefix_list_ids
      self             = each.value.self == null ? false : each.value.self
    }
  }

  dynamic "egress" {
    for_each = var.aws_security_group_egress
    iterator = each
    content {
      from_port        = each.value.from_port == null ? each.value.port : each.value.from_port
      to_port          = each.value.to_port == null ? each.value.port : each.value.to_port
      protocol         = each.value.protocol == null ? "tcp" : each.value.protocol
      security_groups  = each.value.security_groups == null ? [] : each.value.security_groups
      cidr_blocks      = each.value.cidr_blocks == null ? [] : each.value.cidr_blocks
      ipv6_cidr_blocks = each.value.ipv6_cidr_blocks == null ? [] : each.value.ipv6_cidr_blocks
      prefix_list_ids  = each.value.prefix_list_ids == null ? [] : each.value.prefix_list_ids
      self             = each.value.self == null ? false : each.value.self
    }
  }


  tags = merge(
    {
      "name" = format("%s", var.aws_security_group_name)
    },
    var.tags,
    var.aws_security_group_tags,
  )
}

