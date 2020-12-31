
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_instance"
}

dependency "vpc_sercurity_group_admin" {
  config_path = "../security_groups/admin"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_security_group_id = "fake-security-group-id"
  }
}

dependency "subnet" {
  config_path = "../subnet"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_subnet_id = "fake-subnet-id"
  }
}

dependency "key_pair" {
  config_path = "./key_pair"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_key_pair_id = "fake-key-pair-id"
  }
}

inputs = {
  aws_instance_count = 1
  aws_ami_owners = [ 137112412989 ]
  aws_ami_filters = [
    {
      name   = "name"
      values = ["amzn2-ami-hvm*"]
    },
    {
      name   = "virtualization-type"
      values = ["hvm"]
    }
  ]

  aws_instance_name = "testb"
  aws_instance_key_name = dependency.key_pair.outputs.aws_key_pair_id
  aws_instance_instance_type = "t2.micro"

  # any change on network interface
  # list trigger an instance recreation
  aws_instance_network_interfaces = [
    {
      device_index = 0
      subnet_id = dependency.subnet.outputs.aws_subnet_id
      security_groups = [ dependency.vpc_sercurity_group_admin.outputs.aws_security_group_id ]
    },
  ]
}
