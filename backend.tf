
terraform {
  backend "s3" {
    bucket = "terraform-backend-newbatchfeb2025"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
