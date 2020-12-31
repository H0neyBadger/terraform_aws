
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_vpc"
}

inputs = {
  aws_vpc_name = "vpcB"
  aws_vpc_cidr_block = "10.2.0.0/16"
  aws_vpc_assign_generated_ipv6_cidr_block = true
  aws_vpc_enable_dns_support = true
  aws_vpc_enable_dns_hostnames = true
}

