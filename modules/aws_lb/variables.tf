
variable "aws_lb_internal" {
  type = bool
  default = null
}

variable "aws_lb_load_balancer_type" {
  type = string
  default = null

  validation {
    condition     = can(regex("^(application|gateway|network)$", var.aws_lb_load_balancer_type))
    error_message = "The load_balancer_type value must be one of `application`, `gateway` or `network` ."
  }
}

variable "aws_lb_security_groups" {
  type = list(string)
  default = null
}

variable "aws_lb_subnets" {
  type = list(string)
  default = null
}

variable "aws_lb_enable_deletion_protection" {
  type = bool
  default = null
}

variable "aws_lb_access_logs" {
  type = list(object({
    bucket  = string
    prefix  = optional(string)
    enabled = optional(bool)
  }))
  default = []
}

variable "aws_lb_ip_address_type" {
  type = string
  default = null

  validation {
    condition     = can(regex("^(ipv4|dualstack)$", var.aws_lb_ip_address_type))
    error_message = "The ip_address_type value must be one of `ipv4` or `dualstack`."
  }
}

variable "aws_lb_subnet_mapping" {
  type = list(object({
      subnet_id            = string
      allocation_id        = optional(string)
      private_ipv4_address = optional(string)
  }))
  default = []
}

variable "aws_lb_name" {
  type = string
  default = "aws-lb"
}

variable "aws_lb_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

