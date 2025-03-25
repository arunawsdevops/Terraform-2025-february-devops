terraform {
  backend "s3" {
    bucket = "terra-state-new-instance"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}