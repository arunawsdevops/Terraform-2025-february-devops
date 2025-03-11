terraform {
  backend "s3" {
    bucket = "terra-form-aws-123"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}