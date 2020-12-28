
resource "aws_route_table" "route_table" {
  vpc_id     = var.aws_route_table_vpc_id

  tags = merge(
    {
      "Name" = format("%s", var.aws_route_table_name)
    },
    var.tags,
    var.aws_route_table_tags,
  )
}

