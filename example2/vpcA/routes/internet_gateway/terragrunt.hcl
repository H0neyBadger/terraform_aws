
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_route"
}

dependency "vpc" {
  config_path = "../../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_default_route_table_id = "fake-vpc-default-route-table-id"
  }
}

dependency "internet_gateway" {
  config_path = "../../internet_gateway"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_internet_gateway_id = "fake-internet-gateway-id"
  }
}

inputs = {
  aws_route_route_table_id = dependency.vpc.outputs.aws_vpc_default_route_table_id
  aws_route_destination_cidr_block = "0.0.0.0/0"
  aws_route_gateway_id = dependency.internet_gateway.outputs.aws_internet_gateway_id
}

