
variable "aws_subnet_vpc_id" {
  type = string
}

variable "aws_subnet_cidr_block" {
  type = string
}

variable "aws_subnet_ipv6_cidr_block" {
  type = string
  default = null
}

variable "aws_subnet_assign_ipv6_address_on_creation" {
  type = bool
  default = null
}

variable "aws_subnet_name" {
  type = string
  default = "aws-subnet"
}

variable "aws_subnet_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

