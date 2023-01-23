data "aws_caller_identity" "Account2" {
  provider = aws.Account2
}
resource "aws_ram_resource_share" "tgw-share" {
  provider = aws.Account1
  name     = "transit-gateway-share"
  allow_external_principals = var.allow_external_principals

  tags = {
    Name = "transit-gateway-share"
  }
}

# Share the transit gateway...
resource "aws_ram_resource_association" "tgw-share-association" {
  provider = aws.Account1

  resource_arn       = aws_ec2_transit_gateway.Account1-region1.arn
  resource_share_arn = aws_ram_resource_share.tgw-share.id
}

# Sharing with Account 2.
resource "aws_ram_principal_association" "tgw-share-principal" {
  provider = aws.Account1

  principal          = data.aws_caller_identity.Account2.account_id
  resource_share_arn = aws_ram_resource_share.tgw-share.id
}
