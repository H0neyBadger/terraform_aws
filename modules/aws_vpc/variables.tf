
variable "aws_vpc_instance_tenancy" {
  type = string
  default = "default"
}

variable "aws_vpc_cidr_block" {
  type = string
}

variable "aws_vpc_assign_generated_ipv6_cidr_block" {
  type = bool
  default = null
}

variable "aws_vpc_enable_dns_support" {
  type = bool
  default = null
}

variable "aws_vpc_enable_dns_hostnames" {
  type = bool
  default = null
} 

variable "aws_vpc_enable_classiclink" {
  type = bool
  default = null
}

variable "aws_vpc_enable_classiclink_dns_support" {
  type = bool
  default = null
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

