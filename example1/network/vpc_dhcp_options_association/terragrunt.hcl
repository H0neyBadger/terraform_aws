
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_vpc_dhcp_options_association"
}

dependency "vpc" {
  config_path = "../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
  }
}

dependency "vpc_dhcp_options" {
  config_path = "../vpc_dhcp_options"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_dhcp_options_id = "fake-vpc-dhcp-options-id"
  }
}

inputs = {
  aws_vpc_dhcp_options_association_vpc_id = dependency.vpc.outputs.aws_vpc_id
  aws_vpc_dhcp_options_association_dhcp_options_id = dependency.vpc_dhcp_options.outputs.aws_vpc_dhcp_options_id
}

