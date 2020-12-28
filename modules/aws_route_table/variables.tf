
variable "aws_route_table_vpc_id" {
  type = string
}

variable "aws_route_table_route" {
  type = list(object({
    cidr_block                = optional(string) 
    ipv6_cidr_block           = optional(string) 
    egress_only_gateway_id    = optional(string) 
    gateway_id                = optional(string) 
    instance_id               = optional(string) 
    nat_gateway_id            = optional(string) 
    local_gateway_id          = optional(string) 
    network_interface_id      = optional(string) 
    transit_gateway_id        = optional(string) 
    vpc_endpoint_id           = optional(string) 
    vpc_peering_connection_id = optional(string) 
  }))
  default = []
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

