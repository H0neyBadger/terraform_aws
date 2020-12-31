
output "aws_vpc_peering_connection_id" {
  value = aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter.id
}

output "aws_vpc_peering_connection_accepter_id" {
  value = aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter.id
}

