
variable "aws_subnet_vpc_id" {
  type = string
}

variable "aws_subnet_cidr_block" {
  type = string
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

