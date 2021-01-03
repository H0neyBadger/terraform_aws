
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_cloudfront_distribution"
}

dependency "s3_bucket" {
  config_path = "../s3_bucket"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_s3_bucket_bucket_regional_domain_name = "fake-bucket-regional-domain-name"
  }
}

locals {
  s3_origin_id = "primaryS3"
}

inputs = {
  aws_cloudfront_distribution_enabled = true

  aws_cloudfront_distribution_origins = [
    {
      domain_name = dependency.s3_bucket.outputs.aws_s3_bucket_bucket_regional_domain_name
      origin_id   = local.s3_origin_id
      s3_origin_config = [
        { origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567" }
      ],
    },
  ]

  aws_cloudfront_distribution_default_cache_behavior = [
    {
      target_origin_id       = local.s3_origin_id
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      viewer_protocol_policy = "redirect-to-https"
      forwarded_values = [
        {
          query_string = false
          cookies = [{ forward = "none" }]
        }
      ]
    },
  ]

  aws_cloudfront_distribution_restrictions = [
    {
      geo_restriction = [ { restriction_type = "none" } ]
    }
  ]

  aws_cloudfront_distribution_viewer_certificate = [
    {
      cloudfront_default_certificate = true
      minimum_protocol_version       = "TLSv1"
    }
  ]
}

