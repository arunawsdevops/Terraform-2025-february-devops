resource "aws_instance" "instance" {
  ami           = var.instance_ami # Amazon Linux 2 AMI (change as needed)
  instance_type =  var.instance-type
  count = var.instance-count
  associate_public_ip_address = var.public-ip
}