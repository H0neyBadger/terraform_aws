include {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_vpc"
}

inputs = {
  aws_vpc_name = "example1"
  aws_vpc_cidr_block = "172.31.0.0/16"
  aws_vpc_assign_generated_ipv6_cidr_block = true
}

