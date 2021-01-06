
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_lb_listener"
}

dependency "nlb" {
  config_path = "../../nlb"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_lb_arn = "arn:aws:iam::1234567890:fake/value"
  }
}

dependency "target_group" {
  config_path = "../target_group"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_lb_target_group_arn = "arn:aws:iam::1234567890:fake/value"
  }
}

inputs = {
  aws_lb_listener_load_balancer_arn = dependency.nlb.outputs.aws_lb_arn
  aws_lb_target_group_target_type   = "instance"
  aws_lb_listener_port              = 80
  aws_lb_listener_protocol          = "TCP"

  aws_lb_listener_default_action    = [{
    type             = "forward"
    target_group_arn = dependency.target_group.outputs.aws_lb_target_group_arn
 }]
}
