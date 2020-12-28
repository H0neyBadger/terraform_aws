include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_security_group"
}

dependency "vpc" {
  config_path = "../../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
  }
}

inputs = {
  aws_security_group_name = "default"
  aws_security_group_description = "default VPC security group"
  aws_security_group_vpc_id = dependency.vpc.outputs.aws_vpc_id

  aws_security_group_ingress = [
    {
      port = 0
      protocol = "-1"
      self = true
    },
  ]

  aws_security_group_egress = [
    {
      port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    },
  ]
}
