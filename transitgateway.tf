# Transit Gateway for Account 1 in ap-south-1

resource "aws_ec2_transit_gateway" "TGW-Account1-region1" {
  provider   = aws.Account1-region1
  description = "Transit Gateway in ap-south-1"
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation 
  transit_gateway_cidr_blocks     = var.transit_gateway_cidr_blocks
}

# Transit Gateway for Account 1 in us-east-1

resource "aws_ec2_transit_gateway" "TGW-Account1-region2" {
  provider   = aws.Account1-region2
  description = "Transit Gateway in us-east-1"
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  transit_gateway_cidr_blocks     = var.transit_gateway_cidr_blocks
}
