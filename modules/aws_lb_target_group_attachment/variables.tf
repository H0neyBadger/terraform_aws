
variable "aws_lb_target_group_attachment_target_group_arn" {
  type = string
}

variable "aws_lb_target_group_attachment_target_ids" {
  type = list(string)
  default = []
}

variable "aws_lb_target_group_attachment_port" {
  type = string
  default = null
}

variable "aws_lb_target_group_attachment_availability_zone" {
  type = string
  default = null
}

