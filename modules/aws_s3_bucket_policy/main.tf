
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = var.aws_s3_bucket_policy_bucket
  policy = var.aws_s3_bucket_policy_policy
}

