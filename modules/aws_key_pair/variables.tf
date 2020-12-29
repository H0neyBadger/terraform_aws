
variable "aws_key_pair_key_name" {
  type = string
}

variable "aws_key_pair_public_key" {
  type = string
}

variable "aws_key_pair_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

