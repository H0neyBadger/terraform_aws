
variable "aws_vpc_cidr_block" {
  type = string
}

variable "aws_vpc_assign_generated_ipv6_cidr_block" {
  type = bool
  default = false
}

variable "aws_vpc_name" {
  type = string
  default = "aws-vpc"
}

variable "aws_vpc_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

