
resource "aws_lb_target_group_attachment" "lb_target_group_attachment" {
  for_each = toset(var.aws_lb_target_group_attachment_target_ids)

  target_group_arn  = var.aws_lb_target_group_attachment_target_group_arn
  target_id         = each.key
  port              = var.aws_lb_target_group_attachment_port
  availability_zone = var.aws_lb_target_group_attachment_availability_zone
}

