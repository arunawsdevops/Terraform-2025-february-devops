
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "my-vpc"
  }
}
resource "aws_key_pair" "ec2_key" {
  key_name   = "my-ec2-key" 
  public_key = file("id_rsa.pub") 
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.vpc_cidr_block
  availability_zone = "us-east-1a" 
  tags = {
    Name = "my-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_security_group" "instance_sg" {
  vpc_id = aws_vpc.my_vpc.id
  name   = "instance-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instance-sg"
  }
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  count = var.instance_count
  associate_public_ip_address = var.public_ip_assign
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.instance_sg.id]

  tags = {
    Name = "my-instance"
  }
}

resource "aws_route" "route" {
 route_table_id = aws_route_table.public_route_table.id
 destination_cidr_block = "0.0.0.0/0"
 gateway_id = aws_internet_gateway.igw.id

}
  

