variable "aws_vpc_peering_connection_accepter_vpc_peering_connection_id" {
  type = string
}

variable "aws_vpc_peering_connection_accepter_auto_accept" {
  type = bool
  default = null
}

variable "aws_vpc_peering_connection_accepter_name" {
  type = string
  default = "aws-vpc-peering-connection-accepter"
}

variable "aws_vpc_peering_connection_accepter_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

