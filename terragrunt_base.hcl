
locals {
  # https://github.com/gruntwork-io/terragrunt-infrastructure-live-example/blob/master/terragrunt.hcl

  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  backend_vars     = read_terragrunt_config(find_in_parent_folders("backend.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  aws_region       = local.region_vars.locals != null ? lookup(local.region_vars.locals, "aws_region", null) : null

  # force default values in tags
  tags             = lookup(local.environment_vars.locals, "tags", {})
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 3.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}

provider "aws" {
%{ if local.aws_region != null }
  region = "${local.aws_region}"
%{ endif }
}

EOF
}

inputs = merge(
  local.environment_vars.locals,
  { aws_region = local.aws_region, tags = local.tags }
)

