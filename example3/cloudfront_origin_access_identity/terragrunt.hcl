
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_cloudfront_origin_access_identity"
}

inputs = {
  aws_cloudfront_origin_access_identity_comment = "example3"
}

