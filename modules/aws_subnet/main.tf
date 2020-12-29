
resource "aws_subnet" "subnet" {
  vpc_id                          = var.aws_subnet_vpc_id
  cidr_block                      = var.aws_subnet_cidr_block
  ipv6_cidr_block                 = var.aws_subnet_ipv6_cidr_block
  assign_ipv6_address_on_creation = var.aws_subnet_assign_ipv6_address_on_creation

  tags = merge(
    {
      "Name" = format("%s", var.aws_subnet_name)
    },
    var.tags,
    var.aws_subnet_tags,
  )
}

