
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_subnet"
}

dependency "vpc" {
  config_path = "../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
  }
}

inputs = {
  aws_subnet_name = "public"
  aws_subnet_vpc_id = dependency.vpc.outputs.aws_vpc_id
  aws_subnet_cidr_block  = "172.31.32.0/20"
}

