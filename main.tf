resource "aws_s3_bucket" "christy-buket" {
  bucket = var.bucket_name
  
}

resource "aws_vpc" "example" {
  cidr_block = var.cidr_block
}