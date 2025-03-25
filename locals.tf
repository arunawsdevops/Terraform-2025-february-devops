locals {
  vpc_cidr_block     = "10.0.0.0/16"               # VPC CIDR block
  subnet_cidr_block  = "10.0.1.0/24"               # Subnet CIDR block
  availability_zone  = "us-east-1a"                # Availability Zone
  ami_id             = "ami-08b5b3a93ed654d19"     # Update to a region-specific AMI
  instance_type      = "t2.micro"                  # Instance type
}
