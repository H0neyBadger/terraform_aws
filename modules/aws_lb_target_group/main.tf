
resource "aws_lb_target_group" "lb_target_group" {
  name                               = var.aws_lb_target_group_name
  name_prefix                        = var.aws_lb_target_group_name_prefix
  port                               = var.aws_lb_target_group_port
  protocol                           = var.aws_lb_target_group_protocol
  vpc_id                             = var.aws_lb_target_group_vpc_id
  deregistration_delay               = var.aws_lb_target_group_deregistration_delay
  slow_start                         = var.aws_lb_target_group_slow_start
  load_balancing_algorithm_type      = var.aws_lb_target_group_load_balancing_algorithm_type
  lambda_multi_value_headers_enabled = var.aws_lb_target_group_lambda_multi_value_headers_enabled
  proxy_protocol_v2                  = var.aws_lb_target_group_proxy_protocol_v2
  target_type                        = var.aws_lb_target_group_target_type

  dynamic "stickiness" {
    for_each = var.aws_lb_target_group_stickiness
    iterator = each

    content {
      type            = each.value.type
      cookie_duration = each.value.cookie_duration
      enabled         = each.value.enabled
    }
  }

  dynamic "health_check" {
    for_each = var.aws_lb_target_group_health_check
    iterator = each

    content {
      enabled             = each.value.enabled
      interval            = each.value.interval
      path                = each.value.path
      port                = each.value.port
      protocol            = each.value.protocol
      timeout             = each.value.timeout
      healthy_threshold   = each.value.healthy_threshold
      unhealthy_threshold = each.value.unhealthy_threshold
      matcher             = each.value.matcher
    }
  }

  tags = merge(
    {
      "Name" = format("%s", var.aws_lb_target_group_name)
    },
    var.tags,
    var.aws_lb_target_group_tags,
  )
}

