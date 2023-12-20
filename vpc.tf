# Create a VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = "192.0.0.0/16"
}

# create a subnet
resource "aws_subnet" "terraform_subnet1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "192.0.1.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform_subnet1"
  }
}

# create a subnet
resource "aws_subnet" "terraform_subnet2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "192.0.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "terraform_subnet2"
  }
}

# create a subnet
resource "aws_subnet" "terraform_subnet3" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "192.0.3.0/24"
  availability_zone = "ap-south-1c"
  tags = {
    Name = "terraform_subnet3"
  }
}


# create internet gateway
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_igw"
  }
}
#create route table
resource "aws_route_table" "rt1terraform_route" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }
  tags = {
    Name = "terraform_route_table"
  }
}

resource "aws_route_table_association" "terraform_route" {
  subnet_id      = aws_subnet.terraform_subnet1.id
  route_table_id = aws_route_table.rt1terraform_route.id
}

#create security group
resource "aws_security_group" "terraform_sg" {
  vpc_id = aws_vpc.terraform_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}