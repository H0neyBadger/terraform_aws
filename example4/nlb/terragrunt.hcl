
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_lb"
}

# dependency "vpc_sercurity_group_admin" {
#   config_path = "../vpc/security_groups/admin"
#
#   # mock_outputs_allowed_terraform_commands = ["validate"]
#   mock_outputs = {
#     aws_security_group_id = "fake-security-group-id"
#   }
# }

dependency "admin_subnet" {
  config_path = "../vpc/admin_subnet"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_subnet_id = "fake-subnet-id"
  }
}

inputs = {
  aws_lb_name               = "example-nlb"
  aws_lb_internal           = false
  aws_lb_load_balancer_type = "network"
  aws_lb_subnets            = [dependency.admin_subnet.outputs.aws_subnet_id]
  aws_lb_ip_address_type    = "dualstack"
}
