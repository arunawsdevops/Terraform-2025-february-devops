terraform {
  backend "s3" {
    bucket = "christy-special-bucket"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}