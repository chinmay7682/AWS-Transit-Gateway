## Creating VPC and subnets for Account 1 in ap-south-1

resource "aws_vpc" "Account1-vpc1" {
  provider   = aws.Account1-region1
  cidr_block = "10.30.0.0/16"
}

resource "aws_subnet" "account1-vpc1-subnet1" {
    provider   = aws.Account1-region1
  vpc_id               = aws_vpc.Account1-vpc1.id
  availability_zone = "ap-south-1a"
  cidr_block           = "10.30.1.0/24"
}

resource "aws_subnet" "account1-vpc1-subnet2" {
    provider   = aws.Account1-region1
  vpc_id               = aws_vpc.Account1-vpc1.id
  availability_zone = "ap-south-1a"
  cidr_block           = "10.30.2.0/24"
}

resource "aws_route_table" "RT-account1-vpc1" {
    provider   = aws.Account1-region1
  vpc_id = aws_vpc.Account1-vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Account1.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "RTA-account1-vpc1-subnet1" {
    provider   = aws.Account1-region1
  subnet_id      = aws_subnet.account1-vpc1-subnet1.id
  route_table_id = aws_route_table.RT-account1-vpc1.id
}

resource "aws_route_table_association" "RTA-account1-vpc1-subnet1" {
    provider   = aws.Account1-region1
  subnet_id      = aws_subnet.account1-vpc1-subnet2.id
  route_table_id = aws_route_table.RT-account1-vpc1.id
}

## Creating VPC and subnets in Account 2

resource "aws_vpc" "Account2-vpc1" {
  provider   = aws.Account2
  cidr_block = "10.40.0.0/16"
}

resource "aws_subnet" "Account2-vpc1-subnet1" {
    provider   = aws.Account2
  vpc_id               = aws_vpc.Account2-vpc1.id
  availability_zone = "ap-south-1a"
  cidr_block           = "10.40.1.0/24"
}

resource "aws_subnet" "Account2-vpc1-subnet2" {
    provider   = aws.Account2
  vpc_id               = aws_vpc.Account2-vpc1.id
  availability_zone = "ap-south-1a"
  cidr_block           = "10.40.2.0/24"
}

resource "aws_route_table" "RT-Account2-vpc1" {
    provider   = aws.Account2
  vpc_id = aws_vpc.Account2-vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Account2.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "RTA-Account2-vpc1-subnet1" {
  provider   = aws.Account2
  subnet_id      = aws_subnet.Account2-vpc1-subnet1.id
  route_table_id = aws_route_table.RT-Account2-vpc1.id
}

resource "aws_route_table_association" "RTA-Account2-vpc1-subnet2" {
    provider   = aws.Account2
  subnet_id      = aws_subnet.Account2-vpc1-subnet2.id
  route_table_id = aws_route_table.RT-Account2-vpc1.id
}

## Creating VPC and subnets for Account 1 in us-east-1

resource "aws_vpc" "Account1-vpc2" {
  provider   = aws.Account1-region2
  cidr_block = "10.50.0.0/16"
}

resource "aws_subnet" "account1-vpc2-subnet1" {
  provider   = aws.Account1-region2
  vpc_id               = aws_vpc.Account1-vpc2.id
  availability_zone = "ap-south-1a"
  cidr_block           = "10.50.1.0/24"
}

resource "aws_subnet" "account1-vpc2-subnet2" {
  provider   = aws.Account1-region2
  vpc_id               = aws_vpc.Account1-vpc2.id
  availability_zone = "ap-south-1a"
  cidr_block           = "10.50.2.0/24"
}

resource "aws_route_table" "RT-account1-vpc2" {
  provider   = aws.Account1-region2
  vpc_id = aws_vpc.Account1-vpc2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.Account1.id
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "RTA-account1-vpc2-subnet1" {
  provider   = aws.Account1-region2
  subnet_id      = aws_subnet.account1-vpc2-subnet1.id
  route_table_id = aws_route_table.RT-account1-vpc2.id
}

resource "aws_route_table_association" "RTA-account1-vpc2-subnet1" {
  provider   = aws.Account1-region2
  subnet_id      = aws_subnet.account1-vpc2-subnet2.id
  route_table_id = aws_route_table.RT-account1-vpc2.id
}