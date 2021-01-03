
resource "aws_cloudfront_origin_access_identity" "cloudfront_origin_access_identity" {
  comment = var.aws_cloudfront_origin_access_identity_comment
}

