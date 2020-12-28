
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.example.id

  tags = merge(
    {
      "Name" = format("%s", var.aws_nat_gateway_name)
    },
    var.tags,
    var.aws_nat_gateway_tags,
  )
}

