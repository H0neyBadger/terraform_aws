
resource "aws_key_pair" "key_pair" {
  key_name   = var.aws_key_pair_key_name
  public_key = var.aws_key_pair_public_key

  tags = merge(
    {
      "Name" = format("%s", var.aws_key_pair_key_name)
    },
    var.tags,
    var.aws_key_pair_tags,
  )
}

