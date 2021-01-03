
variable "aws_s3_bucket_bucket" {
  type = string
  default = null
}

variable "aws_s3_bucket_acl" {
  type = string
  default = null
}

variable "aws_s3_bucket_name" {
  type = string
  default = "aws-s3-bucket"
}

variable "aws_s3_bucket_tags" {
  type = map(string)
  default = {}
}

variable "tags" {
  type = map(string)
  default = {}
}

