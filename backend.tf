terraform {
  backend "s3" {
    bucket = "renjithtest123"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}