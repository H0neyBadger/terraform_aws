
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

locals {
  peer_region_vars = read_terragrunt_config("../../vpcB/region.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_vpc_peering_connection"
}

dependency "vpcA" {
  config_path = "../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
    aws_vpc_owner_id = "1234567890"
  }
}

dependency "vpcB" {
  config_path = "../../vpcB/vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
    aws_vpc_owner_id = "1234567890"
  }
}

inputs = {
  aws_vpc_peering_connection_vpc_id = dependency.vpcA.outputs.aws_vpc_id
  aws_vpc_peering_connection_peer_vpc_id = dependency.vpcB.outputs.aws_vpc_id
  aws_vpc_peering_connection_peer_owner_id = dependency.vpcB.outputs.aws_vpc_owner_id
  # whithout peer region. it fails to retrieve the vpc id with the message :
  # Failed due to incorrect VPC-ID, Account ID, or overlapping CIDR range
  aws_vpc_peering_connection_peer_region = local.peer_region_vars.locals.aws_region
  # Error: peer_region cannot be set whilst auto_accept is true when creating a vpc peering connection
  # aws_vpc_peering_connection_auto_accept = false
}

