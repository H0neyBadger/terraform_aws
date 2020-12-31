
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_instance"
}

dependency "vpc_sercurity_group_admin" {
  config_path = "../vpc/security_groups/admin"

  # mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    aws_security_group_id = "fake-security-group-id"
  }
}

dependency "admin_subnet" {
  config_path = "../vpc/admin_subnet"

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

dependencies {
  paths = [
    "../vpc/vpc_dhcp_options/association"
  ]
}

inputs = {
  aws_instance_count = 2
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

  aws_instance_name = "admin"
  aws_instance_key_name = dependency.key_pair.outputs.aws_key_pair_id
  aws_instance_instance_type = "t2.micro"

  # Use explicit security group fix issue:
  # "Error launching source instance: VPCIdNotSpecified"
  # aws_instance_vpc_security_group_ids = [
  #   dependency.vpc.outputs.aws_vpc_default_security_group_id
  # ]

  # any change on network interface
  # list trigger an instance recreation
  aws_instance_network_interfaces = [
    {
      device_index = 0
      subnet_id = dependency.admin_subnet.outputs.aws_subnet_id
      security_groups = [ dependency.vpc_sercurity_group_admin.outputs.aws_security_group_id ]
      ipv6_address_count = 1
    },
  ]
}