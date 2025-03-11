terraform {
  backend "s3" {
    bucket = "terraform-nahla-123"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}