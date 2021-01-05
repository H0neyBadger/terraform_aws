
output "aws_instance_ids" {
  value = aws_instance.instance.*.id
}

output "aws_instance_arns" {
  value = aws_instance.instance.*.arn
}

