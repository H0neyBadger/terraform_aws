
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

dependency "vpcA" {
  config_path = "../../../vpcA/vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_cidr_block = "0.0.0.0/0"
  }
}

dependency "vpc_peering_connection" {
  config_path = "../../../vpcA/vpc_peering_connection"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_peering_connection_id = "fake-vpc-peering-connection-id"
  }
}

dependencies {
  # start after vpc validation
  paths = ["../../../vpcB/vpc_peering_connection/accepter"]
}

inputs = {
  aws_route_route_table_id = dependency.vpc.outputs.aws_vpc_default_route_table_id
  aws_route_vpc_peering_connection_id = dependency.vpc_peering_connection.outputs.aws_vpc_peering_connection_id
  aws_route_destination_cidr_block = dependency.vpcA.outputs.aws_vpc_cidr_block
}

