
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = var.aws_lb_listener_load_balancer_arn
  port              = var.aws_lb_listener_port
  protocol          = var.aws_lb_listener_protocol
  ssl_policy        = var.aws_lb_listener_ssl_policy
  certificate_arn   = var.aws_lb_listener_certificate_arn

  dynamic "default_action" {
    for_each = var.aws_lb_listener_default_action
    iterator = each

    content {
      type             = each.value.type
      target_group_arn = each.value.target_group_arn
    }
  }
}

