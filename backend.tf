terraform {
  backend "s3" {
    bucket = "sayand-terraform-state"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}