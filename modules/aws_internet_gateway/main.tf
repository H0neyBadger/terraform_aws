
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id     = var.aws_internet_gateway_vpc_id

  tags = merge(
    {
      "name" = format("%s", var.aws_internet_gateway_name)
    },
    var.tags,
    var.aws_internet_gateway_tags,
  )
}

