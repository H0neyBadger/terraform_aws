
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_s3_bucket_policy"
}

dependency "s3_bucket" {
  config_path = "../../s3_bucket"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_s3_bucket_id = "fake-s3-bucket-id"
  }
}

dependency "iam_policy_document" {
  config_path = "../../data_iam_policy_document"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_iam_policy_document_json = "{ 'fake-data-iam-policy-document-json': null }"
  }
}

inputs = {
  aws_s3_bucket_policy_bucket = dependency.s3_bucket.outputs.aws_s3_bucket_id
  aws_s3_bucket_policy_policy = dependency.iam_policy_document.outputs.aws_iam_policy_document_json
}

