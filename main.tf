resource "aws_instance" "ec2_example" {
  ami = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = var.enable_public_ip
  tags = var.project_environment
}
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}
resource "aws_subnet" "subnet" {
  vpc_id =  aws_vpc.main.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true 
}
resource "aws_security_group" "sg1" {
  vpc_id = aws_vpc.main.id
}