terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
    profile= "default"
}
 # access_key = "your-access-key-id"     # Replace with your actual AWS Access Key
 # secret_key = "your-secret-access-key"
