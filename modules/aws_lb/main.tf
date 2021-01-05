
resource "aws_lb" "lb" {
  name                       = var.aws_lb_name
  internal                   = var.aws_lb_internal
  load_balancer_type         = var.aws_lb_load_balancer_type
  security_groups            = var.aws_lb_security_groups
  subnets                    = var.aws_lb_subnets
  enable_deletion_protection = var.aws_lb_enable_deletion_protection

  dynamic "access_logs" {
    for_each = var.aws_lb_access_logs
    iterator = each

    content {
      bucket  = each.value.bucket
      prefix  = each.value.prefix
      enabled = each.value.enable
    }
  }

  dynamic "subnet_mapping" {
    for_each = var.aws_lb_subnet_mapping
    iterator = each

    content {
      subnet_id            = each.value.subnet_id
      allocation_id        = each.value.allocation_id
      private_ipv4_address = each.value.private_ipv4_address
    }
  }

  tags = merge(
    {
      "Name" = format("%s", var.aws_lb_name)
    },
    var.tags,
    var.aws_lb_tags,
  )
}

