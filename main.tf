
resource "aws_vpc" "myserver-vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {

        Name = "My-infra-vpc-${terraform.workspace}"
    }

  
}
resource "aws_subnet" "myserver-public-subnet" {
    vpc_id = aws_vpc.myserver-vpc.id
    cidr_block = var.cidr_block-value-pub
    availability_zone = "us-east-1a"
    tags = {
        Name = "My-infra-vpc-pub-subnet"
    }

}

resource "aws_subnet" "myserver-private-subnet" {
    vpc_id = aws_vpc.myserver-vpc.id
    cidr_block = var.cidr_block-value-pri
    availability_zone = "us-east-1b"
    tags = {
        Name = "My-infra-vpc-pri-subnet"
    }
  
}

resource "aws_internet_gateway" "myserver-igw" {
    vpc_id = aws_vpc.myserver-vpc.id
    tags = {
        Name = "My-infra-vpc-IGW"
    }
  
}

resource "aws_route_table" "myserver-public-RT" {
    vpc_id = aws_vpc.myserver-vpc.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myserver-igw.id
    }
    tags = {
        Name = "My-infra-vpc-pub-RT"
    }
}

resource "aws_route_table" "myserver-private-RT" {
    vpc_id = aws_vpc.myserver-vpc.id
    tags = {
        Name = "My-infra-vpc-pri-RT"
    }
  
}

resource "aws_route_table_association" "myserver-pub-RT-asso" {
    route_table_id = aws_route_table.myserver-public-RT.id
    subnet_id = aws_subnet.myserver-public-subnet.id
}

resource "aws_route_table_association" "myserver-pri-RT-asso" {
    route_table_id = aws_route_table.myserver-private-RT.id
    subnet_id = aws_subnet.myserver-private-subnet.id
    
}

resource "aws_security_group" "myserver-public-SG" {
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] #Allow all ssh from everywhere
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] #Allow all http traffic

    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "My-infra-vpc-pub-SG"
    }
  
}

resource "aws_security_group" "myserver-private-SG" {
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "My-infra-vpc-pri-SG"
    }
}
resource "aws_instance" "myserver-pub-ec2" {
    ami = var.public-instance-ami
    count = 1
    instance_type = var.public-instance-type
    associate_public_ip_address = var.public-ip-decision
    key_name = "pub-nat"
    vpc_security_group_ids = [aws_security_group.myserver-public-SG.id]
    tags = {
        Name = "My-infra-vpc-pub-ec2"
    }
  
}

resource "aws_instance" "myserver-pri-ec2" {
    ami = var.private-instance-ami
    count = 1
    instance_type = var.private-instance-type
    key_name = "pri-nat"
    vpc_security_group_ids = [aws_security_group.myserver-private-SG.id]
    tags = {
        Name = "My-infra-vpc-pri-ec2"
    }
  
}
