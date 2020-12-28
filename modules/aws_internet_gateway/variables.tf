
variable "aws_internet_gateway_vpc_id" {
  type = string
}

variable "aws_internet_gateway_name" {
  type = string
  default = "aws-internet-gateway"
}

variable "aws_internet_gateway_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

