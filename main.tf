resource "aws_s3_bucket" "s3-nahla" {
    bucket = var.bucket_name
}

resource "aws_vpc" "vpc-nahla" {
    cidr_block = var.vpc_cidr
}   