
resource "aws_vpc" "vpc" {
  instance_tenancy                 = var.aws_vpc_instance_tenancy
  cidr_block                       = var.aws_vpc_cidr_block
  assign_generated_ipv6_cidr_block = var.aws_vpc_assign_generated_ipv6_cidr_block
  enable_dns_support               = var.aws_vpc_enable_dns_support
  enable_dns_hostnames             = var.aws_vpc_enable_dns_hostnames
  enable_classiclink               = var.aws_vpc_enable_classiclink
  enable_classiclink_dns_support   = var.aws_vpc_enable_classiclink_dns_support

  tags = merge(
    {
      "Name" = format("%s", var.aws_vpc_name)
    },
    var.tags,
    var.aws_vpc_tags,
  )
}
