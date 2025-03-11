variable "bucket_name" {
  description = "the name of the bucket"
  type = string
  default = "terraform-nahla-123"
}
variable "vpc_cidr" {
  description = "the name of the vpc"
  type = string
  default = "10.0.0.0/16"
}