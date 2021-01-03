
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_s3_bucket"
}

inputs = {
  aws_s3_bucket_name = "example3"
  aws_s3_bucket_acl = "public-read"
}

