
variable "aws_lb_listener_load_balancer_arn" {
  type = string
}

variable "aws_lb_listener_port" {
  type = number
  default = null
}

variable "aws_lb_listener_protocol" {
  type = string
  default = null
}

variable "aws_lb_listener_ssl_policy" {
  type = string
  default = null
}

variable "aws_lb_listener_certificate_arn" {
  type = string
  default = null
}

variable "aws_lb_listener_default_action" {
  type = list(object({
    type             = optional(string)
    target_group_arn = optional(string)
  }))

  validation {
    condition = length(var.aws_lb_listener_default_action) <= 1
    error_message = " You must define 1 default_action."
  }
}
