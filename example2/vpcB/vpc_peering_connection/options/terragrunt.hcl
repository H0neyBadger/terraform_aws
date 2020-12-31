
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_vpc_peering_connection_options"
}

dependency "vpc_peering_connection_accepter" {
  config_path = "../accepter"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_peering_connection_id = "fake-vpc-peering-connection-id"
  }
}

inputs = {
  aws_vpc_peering_connection_options_vpc_peering_connection_id = dependency.vpc_peering_connection_accepter.outputs.aws_vpc_peering_connection_id
  aws_vpc_peering_connection_options_accepter_allow_remote_vpc_dns_resolution = true
}

