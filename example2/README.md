VPC peering
-----------

This example creates 2 vpc (in 2 different regions). It uses terragrunt dependencies to manage requester/accepter order.
* vpcA is the peering requester site, it has the `testa` instance as entry point of this example
* vpcB is the peering accepter site, (minimal setup)

