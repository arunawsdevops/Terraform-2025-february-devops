resource "aws_s3_bucket" "sample-bucket" {
  bucket = var.bucket_name
}

resource "aws_vpc" "sample-vpc" {
  cidr_block = var.vpc_cidr_block  
  tags = {
    Name = "my-vpc"
  }
}