
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_lb_target_group_attachment"
}

dependency "target_group" {
  config_path = "../../nlb/target_group"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_lb_target_group_arn = "arn:aws:iam::1234567890:fake/value"
  }
}

dependency "instance" {
  config_path = "../../instanceB"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_instance_arns = []
  }
}

inputs = {
  aws_lb_target_group_attachment_target_group_arn = dependency.target_group.outputs.aws_lb_target_group_arn
  aws_lb_target_group_attachment_target_ids       = dependency.instance.outputs.aws_instance_arns
}
