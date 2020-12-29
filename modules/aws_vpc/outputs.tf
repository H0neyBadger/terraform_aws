
output "aws_vpc_id" {
  value = aws_vpc.vpc.id
}

output "aws_vpc_arn" {
  value = aws_vpc.vpc.arn
}

output "aws_vpc_cidr_block" {
  value = aws_vpc.vpc.cidr_block 
}

output "aws_vpc_ipv6_association_id" {
  value = aws_vpc.vpc.ipv6_association_id
}

output "aws_vpc_ipv6_cidr_block" {
  value = aws_vpc.vpc.ipv6_cidr_block 
}

output "aws_vpc_main_route_table_id" {
  value = aws_vpc.vpc.main_route_table_id 
}

output "aws_vpc_default_route_table_id" {
  value = aws_vpc.vpc.default_route_table_id 
}

output "aws_vpc_default_network_acl_id" {
  value = aws_vpc.vpc.default_network_acl_id
}

output "aws_vpc_default_security_group_id" {
  value = aws_vpc.vpc.default_security_group_id 
}

output "aws_vpc_dhcp_options_id" {
  value = aws_vpc.vpc.dhcp_options_id
}

output "aws_vpc_owner_id" {
  value = aws_vpc.vpc.owner_id
}

