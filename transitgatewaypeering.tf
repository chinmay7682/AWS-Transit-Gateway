
# Transit Gateway peering request between region ap-south-1 and region us-east-1 of Account 1. 

resource "aws_ec2_transit_gateway_peering_attachment" "Account1-region1-local" {
  peer_account_id         = aws_ec2_transit_gateway.TGW-Account1-region2.owner_id
  peer_region             = var.region2
  peer_transit_gateway_id = aws_ec2_transit_gateway.TGW-Account1-region2.id
  transit_gateway_id      = aws_ec2_transit_gateway.TGW-Account1-region1.id
  depends_on = [
    aws_ec2_transit_gateway.TGW-Account1-region1,
    aws_ec2_transit_gateway.TGW-Account1-region2
  ]

  tags = {
    Name = "TGW Peering Requestor"
  }
}

# Transit Gateway peering accept between region ap-south-1 and region us-east-1 of Account 1. 

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "Account1-region1-peer" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.Account1-region1-local.id

  tags = {
    Name = "Transit gateway peering accept"
  }
}