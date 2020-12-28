
resource "aws_vpc" "vpc" {
  cidr_block       = var.aws_vpc_cidr_block
  instance_tenancy = "default"
  assign_generated_ipv6_cidr_block = var.aws_vpc_assign_generated_ipv6_cidr_block

  tags = merge(
    {
      "name" = format("%s", var.aws_vpc_name)
    },
    var.tags,
    var.aws_vpc_tags,
  )
}
