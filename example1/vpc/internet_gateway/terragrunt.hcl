
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_internet_gateway"
}

dependency "vpc" {
  config_path = "../../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
  }
}

inputs = {
  aws_internet_gateway_vpc_id = dependency.vpc.outputs.aws_vpc_id
}

