
variable "aws_network_acl_vpc_id" {
  type = string
}

variable "aws_network_acl_subnet_ids" {
  type = list(string)
  default = []
}

variable "aws_network_acl_ingress" {
  type = list(object({
      rule_no         = optional(number)
      action          = optional(string)
      protocol        = optional(string)
      port            = optional(number)
      from_port       = optional(number)
      to_port         = optional(number)
      cidr_block      = optional(string)
      ipv6_cidr_block = optional(string)
      icmp_type       = optional(number)
      icmp_code       = optional(number)
  }))
}

variable "aws_network_acl_egress" {
  type = list(object({
      rule_no         = optional(number)
      action          = optional(string)
      protocol        = optional(string)
      port            = optional(number)
      from_port       = optional(number)
      to_port         = optional(number)
      cidr_block      = optional(string)
      ipv6_cidr_block = optional(string)
      icmp_type       = optional(number)
      icmp_code       = optional(number)
  }))
}

variable "aws_network_acl_name" {
  type = string
  default = "aws-security-group"
}

variable "aws_network_acl_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

