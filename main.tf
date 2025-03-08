resource "aws_s3_bucket" "christy-buket" {
  bucket = "this-ismy-bucket"
  
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}