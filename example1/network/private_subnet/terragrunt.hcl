
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
    aws_vpc_cidr_block = "0.0.0.0/8"
    aws_vpc_cidr_block = "::/56"
  }
}

inputs = {
  aws_subnet_name = "private"
  aws_subnet_vpc_id = dependency.vpc.outputs.aws_vpc_id
  aws_subnet_cidr_block  = cidrsubnet(dependency.vpc.outputs.aws_vpc_cidr_block, 4, 1)
  aws_subnet_ipv6_cidr_block  = cidrsubnet(dependency.vpc.outputs.aws_vpc_ipv6_cidr_block, 32, 1)
  aws_subnet_assign_ipv6_address_on_creation = true
}

