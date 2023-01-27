# Transit Gateway attachment for VPC1 of Account 1 in Region 2.ap-south-1

resource "aws_ec2_transit_gateway_vpc_attachment" "TGWA-account1-vpc1" {
  provider           = aws.Account1-region1
  subnet_ids         = [aws_subnet.account1-vpc1-subnet1.id]
  transit_gateway_id = aws_ec2_transit_gateway.TGW-Account1-region1.id
  vpc_id             = aws_vpc.Account1-vpc1.id
  depends_on = [
    aws_ec2_transit_gateway.TGW-Account1-region1,
    aws_vpc.Account1-vpc1
  ]

  tags = {
    Name = "Transit gateway VPC attachment for Account 1 in Region 1"
  }
}


# Transit Gateway attachment for VPC2 of Account 1 in Region 2. us-east-1

resource "aws_ec2_transit_gateway_vpc_attachment" "TGWA-account1-vpc2" {
  provider           = aws.Account1-region2
  subnet_ids         = [aws_subnet.account1-vpc2-subnet1.id]
  transit_gateway_id = aws_ec2_transit_gateway.TGW-Account1-region2.id
  vpc_id             = aws_vpc.Account1-vpc2.id
  depends_on = [
    aws_ec2_transit_gateway.TGW-Account1-region2,
    aws_vpc.Account1-vpc2
  ]

  tags = {
    Name = "Transit gateway VPC attachment for Account 1 in Region 2"
  }
}

# Transit Gateway attachment for VPC1 of Account 2 in region 1.ap-south-1. Use the shared Transit Gateway

resource "aws_ec2_transit_gateway_vpc_attachment" "TGWA-account2-vpc1" {
  provider           = aws.Account2
  subnet_ids         = [aws_subnet.account2-vpc1-subnet1.id]
  transit_gateway_id = aws_ec2_transit_gateway.TGW-Account1-region1.id
  vpc_id             = aws_vpc.Account2-vpc1.id
  depends_on = [
    aws_ec2_transit_gateway.TGW-Account1-region1,
    aws_vpc.Account2-vpc1
  ]

  tags = {
    Name = "Transit gateway VPC attachment for Account 2"
  }
}

# Transit Gateway attachment accept for VPC1 of Account 2 in Account 1.ap-south-1

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "TGWA-account2-vpc1-accept" {
  provider                      = aws.Account1-region1
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.TGWA-account2-vpc1.id

  tags = {
    Name = "Transit gateway VPC attachment accept"
  }
}