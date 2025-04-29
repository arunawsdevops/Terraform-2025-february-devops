     resource "aws_vpc" "renjithvpc" {
       cidr_block = var.vpc_cidr
}
     resource "aws_s3_bucket" "test1123" {
  bucket = var.aws_s3_bucket
}