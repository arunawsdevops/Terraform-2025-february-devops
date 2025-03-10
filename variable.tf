variable "s3_bucket_name" {
    description = "name of the s3 bucket"
    type = string
    default ="terraform-bucket-test123-february2025-newbatch"
    
}


variable "vpc_cidr_block" {
    description = "Cidr block for vpc"
    type = string
    default ="11.0.0.0/16"
    
}