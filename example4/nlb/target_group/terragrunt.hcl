
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_lb_target_group"
}

dependencies {
  paths = ["../../nlb"]
}

inputs = {
  aws_lb_target_group_name        = "example-instance-group"
  aws_lb_target_group_target_type = "instance"
  aws_lb_target_group_port        = 80
  aws_lb_target_group_protocol    = "HTTP"
}

