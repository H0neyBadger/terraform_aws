
include {
  path = find_in_parent_folders("terragrunt_base.hcl")
}

locals {
  terragrunt_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

terraform {
  source = "${get_parent_terragrunt_dir()}/modules//aws_vpc_dhcp_options"
}

inputs = {
  aws_vpc_dhcp_options_domain_name = "${local.terragrunt_vars.locals.aws_region}.compute.internal"
  aws_vpc_dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]
}

