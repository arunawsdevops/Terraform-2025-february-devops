terraform {
  backend "s3" {
    bucket = "terra-state-new-infra-arun-12345"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}