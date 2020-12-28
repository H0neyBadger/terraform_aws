
terraform {
  extra_arguments "custom_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh",
      "destroy",
    ]

    required_var_files = [
      find_in_parent_folders("common.tfvars")
    ]
  }
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

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  type = string
  default = null
}

variable "aws_secret_key" {
  type = string
  default = null
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

EOF
}
