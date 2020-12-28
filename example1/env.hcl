locals {
  aws_region = "eu-west-3"
  environment = "test"
  tags = {
    project = "example"
    sources = "https://github.com/H0neyBadger/terraform_aws"
    doc     = "https://github.com/H0neyBadger/terraform_aws/wiki"
    support = "https://github.com/H0neyBadger/terraform_aws/issues"
  }
}
