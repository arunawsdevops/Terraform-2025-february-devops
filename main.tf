resource "aws_s3_bucket" "bucket1" {
  bucket = var.s3_bucket_name
  
}

resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
}