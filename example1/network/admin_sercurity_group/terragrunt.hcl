include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_security_group"
}

dependency "vpc" {
  config_path = "../vpc"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_vpc_id = "fake-vpc-id"
  }
}

inputs = {
  aws_security_group_name = "admin"
  aws_security_group_vpc_id = dependency.vpc.outputs.aws_vpc_id
  aws_security_group_ingress = [
    {
      description = "allow ssh"
      port = 22
      cidr_blocks = ["1.1.1.1/32"]
    },
  ]

  # aws_security_group_egress = [
  #   {
  #     description = "allow all"
  #     port = 0
  #     protocol = "-1"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   },
  # ]
}
