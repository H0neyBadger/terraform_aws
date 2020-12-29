
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_security_group"
}

dependency "vpc" {
  config_path = "../../../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
  }
}

inputs = {
  aws_security_group_name = "admin"
  aws_security_group_description = "Admin VPC security group"
  aws_security_group_vpc_id = dependency.vpc.outputs.aws_vpc_id

  aws_security_group_ingress = [
    {
      description = "allow ipv6 ssh"
      port        = 22
      protocol    = "tcp"
      ipv6_cidr_blocks = ["::/0"]
    },
    {
      description = "allow ipv4 ssh"
      port        = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

  aws_security_group_egress = [
    {
      port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port = 0
      protocol = "-1"
      ipv6_cidr_blocks = ["::/0"]
    },
  ]
}

