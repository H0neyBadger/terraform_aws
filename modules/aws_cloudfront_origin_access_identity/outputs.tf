
output "aws_cloudfront_origin_access_identity_id" {
  value = aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.id
}

output "aws_cloudfront_origin_access_identity_iam_arn" {
  value = aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.iam_arn
}

output "aws_cloudfront_origin_access_identity_cloudfront_access_identity_path" {
  value = aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.cloudfront_access_identity_path
}

