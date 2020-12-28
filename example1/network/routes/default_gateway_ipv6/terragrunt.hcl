include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_route"
}

dependency "route_table" {
  config_path = "../../route_table"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_route_table_id = "fake-route-table-id"
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
  aws_route_route_table_id = dependency.route_table.outputs.aws_route_table_id
  aws_route_gateway_id = dependency.internet_gateway.outputs.aws_internet_gateway_id
  aws_subnet_ipv6_cidr_block  = "::/0"
}

