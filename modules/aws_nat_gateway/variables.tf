
variable "aws_nat_gateway_allocation_id" {
  type = string
}

variable "aws_nat_gateway_subnet_id" {
  type = string
}

variable "aws_nat_gateway_name" {
  type = string
  default = "aws-nat-gateway"
}

variable "aws_nat_gateway_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

