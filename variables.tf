variable "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  type        = string 
  
}

variable "instance_type" {
  description = "type of instance"
  type        = string

}
variable "instance_count" {
  description = "Number of instance"
  type = string
  
}
variable "ami_id" {
  description = "ami of instance"
  type   = string
  
}
variable "public_ip_assign" {
  description = "assign public ip or not"
  type   = bool
  
}