terraform {
  backend "s3" {
    bucket = "terraform-fardheen-project"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}