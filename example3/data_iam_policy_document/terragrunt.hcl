
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//data_aws_iam_policy_document"
}

dependency "s3_bucket" {
  config_path = "../s3_bucket"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_s3_bucket_arn = "fake-s3-bucket-arn"
  }
}

dependency "cloudfront_origin_access_identity" {
  config_path = "../cloudfront_origin_access_identity"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_cloudfront_origin_access_identity_iam_arn = "fake-s3-bucket-arn"
  }
}

inputs = {
  aws_iam_policy_document_statements = [
    {
      actions   = ["s3:GetObject"]
      resources = ["${dependency.s3_bucket.outputs.aws_s3_bucket_arn}/*"]
      principals = [
        {
          type        = "AWS"
          identifiers = [dependency.cloudfront_origin_access_identity.outputs.aws_cloudfront_origin_access_identity_iam_arn]
        }
      ]
    }
  ]
}

