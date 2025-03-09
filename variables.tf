variable "bucket_name" {
  description = "Name of the bucket"
  type        = string 
  default = "sayand-bucket-terraform"
}

variable "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  type        = string
  default = "10.0.0.0/16"

}