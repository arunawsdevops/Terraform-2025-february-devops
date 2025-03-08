resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_name
}