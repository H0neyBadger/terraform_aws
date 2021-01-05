
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_key_pair"
}

inputs = {
  aws_key_pair_key_name = "admin"
  # you may also export the variable in your environment
  # export TF_VAR_aws_key_pair_public_key="ssh-rsa AAAAB
  # aws_key_pair_public_key = "ssh-rsa FAKE KEY"
}

