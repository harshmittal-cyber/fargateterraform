# Create a VPC
resource "aws_vpc" "harsh_vpc" {
  cidr_block = var.cidr_block
  tags= var.tags
}

# Create an Internet Gateway
resource "aws_internet_gateway" "harsh_ig" {
  vpc_id = aws_vpc.harsh_vpc.id
  tags= var.tags
}

# Create a Route Table
resource "aws_route_table" "harsh_route_table" {
  vpc_id = aws_vpc.harsh_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.harsh_ig.id
  }
}

# Create a Subnet
resource "aws_subnet" "harsh_subnet" {
  vpc_id            = aws_vpc.harsh_vpc.id
  cidr_block        = "10.0.0.0/16"
}


#route table association
resource "aws_route_table_association" "harsh-route-association" {
  subnet_id = aws_subnet.harsh_subnet.id
  route_table_id = aws_route_table.harsh_route_table.id
}



