
resource "aws_subnet" "subnet" {
  vpc_id     = var.aws_subnet_vpc_id
  cidr_block = var.aws_subnet_cidr_block

  tags = merge(
    {
      "Name" = format("%s", var.aws_subnet_name)
    },
    var.tags,
    var.aws_subnet_tags,
  )
}

