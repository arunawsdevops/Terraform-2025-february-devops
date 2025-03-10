terraform {
  backend "s3" {
    bucket = "terraform-bucket-test12345-february2025"
    key    = "terraform/terraform.tfstate"
     region = "us-east-1"
  }
}