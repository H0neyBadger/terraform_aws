
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_lb_target_group"
}

dependency "vpc" {
  config_path = "../../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
  }
}

dependencies {
  paths = ["../../nlb"]
}

inputs = {
  aws_lb_target_group_vpc_id      = dependency.vpc.outputs.aws_vpc_id
  aws_lb_target_group_name        = "example-instance-group"
  aws_lb_target_group_target_type = "instance"
  aws_lb_target_group_port        = 80
  aws_lb_target_group_protocol    = "TCP"
}

