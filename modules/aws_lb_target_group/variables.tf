
variable "aws_lb_target_group_name" {
  type = string
  default = null
}

variable "aws_lb_target_group_name_prefix" {
  type = string
  default = null
}

variable "aws_lb_target_group_port" {
  type = number
  default = null
}

variable "aws_lb_target_group_protocol" {
  type = string
  default = null
}

variable "aws_lb_target_group_vpc_id" {
  type = string
  default = null
}

variable "aws_lb_target_group_deregistration_delay" {
  type = number
  default = null
}

variable "aws_lb_target_group_slow_start" {
  type = number
  default = null
}

variable "aws_lb_target_group_load_balancing_algorithm_type" {
  type = string
  default = null
}

variable "aws_lb_target_group_lambda_multi_value_headers_enabled" {
  type = string
  default = null
}

variable "aws_lb_target_group_proxy_protocol_v2" {
  type = bool
  default = null
}

variable "aws_lb_target_group_target_type" {
  type = string
  default = null

  validation {
    condition     = can(regex("^(instance|ip|lambda)$", var.aws_lb_target_group_target_type))
    error_message = "The target_type value must be one of `instance`, `ip` or `lambda`."
  }
}

variable "aws_lb_target_group_stickiness" {
  type = list(object({
    type            = string
    cookie_duration = optional(number)
    enabled         = optional(bool)
  }))
  default = []

  validation {
    condition = length(var.aws_lb_target_group_stickiness) <= 1
    error_message = "Maximum 1 stickiness allowed."
  }
}

variable "aws_lb_target_group_health_check" {
  type = list(object({
    enabled             = optional(bool)
    interval            = optional(number)
    path                = optional(string)
    port                = optional(number)
    protocol            = optional(string)
    timeout             = optional(number)
    healthy_threshold   = optional(number)
    unhealthy_threshold = optional(number)
    matcher             = optional(string)
  }))
  default = []

  validation {
    condition = length(var.aws_lb_target_group_health_check) <= 1
    error_message = "Maximum 1 health_check allowed."
  }
}

variable "aws_lb_target_group_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

