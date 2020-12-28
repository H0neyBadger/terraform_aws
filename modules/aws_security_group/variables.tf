
variable "aws_security_group_vpc_id" {
  type = string
}

variable "aws_security_group_name" {
  type = string
  default = "aws-security-group"
}

variable "aws_security_group_description" {
  type = string
  default = null
}

variable "aws_security_group_ingress" {
  type = list(object({
    description = optional(string)
    port = optional(number)
    from_port = optional(number)
    to_port = optional(number)
    protocol = optional(string)
    security_groups = optional(list(string))
    cidr_blocks = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    prefix_list_ids = optional(list(string))
    self = optional(bool)
  }))
  default = []
}

variable "aws_security_group_egress" {
  type = list(object({
    description = optional(string)
    port = optional(number)
    from_port = optional(number)
    to_port = optional(number)
    protocol = optional(string)
    security_groups = optional(list(string))
    cidr_blocks = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    prefix_list_ids = optional(list(string))
    self = optional(bool)
  }))
  default = []
}

variable "aws_security_group_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

