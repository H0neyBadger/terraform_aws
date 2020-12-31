
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_vpc_peering_connection_accepter"
}

dependency "vpc_peering_connection" {
  config_path = "../../../vpcA/vpc_peering_connection"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_peering_connection_id = "fake-vpc-peering-connection-id"
  }
}

inputs = {
  aws_vpc_peering_connection_accepter_vpc_peering_connection_id = dependency.vpc_peering_connection.outputs.aws_vpc_peering_connection_id
  aws_vpc_peering_connection_accepter_auto_accept = true
}

