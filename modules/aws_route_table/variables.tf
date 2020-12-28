
variable "aws_route_table_vpc_id" {
  type = string
}

variable "aws_route_table_name" {
  type = string
  default = "aws-route-table"
}

variable "aws_route_table_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

