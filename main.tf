
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my-subnet"
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }

   tags = {
    Name = "my-rt"
  }
}

resource "aws_route_table_association" "my-rt-association" {
  subnet_id      = aws_subnet.my-subnet.id
  route_table_id = aws_route_table.my-rt.id
}



resource "aws_security_group" "my-vpc-sg" {
  name        = "my-vpc-sg"
  vpc_id      =  aws_vpc.my-vpc.id

  

ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "my-vpc-sg"
  }
  }

  resource "aws_instance" "my-instance"{
    ami= "var.os-name"
    key_name="new-key"
    instance_type= "t2.micro"
    subnet_id= aws_subnet.my-subnet.id
    vpc_security_group_ids= [aws_security_group.my-vpc-sg.id]
   }

