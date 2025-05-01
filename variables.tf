variable "public-instance-ami" {
    description = "this holds the AMI value of public instance"
    type = string
}
variable "private-instance-ami" {
    description = "this holds the AMI value of private instance"
    type = string
}
variable "cidr_block-value-pub" {
    description = "this block holds the cidr value of public instance"
    type = string
  
}
variable "cidr_block-value-pri" {
    description = "this block holds the cidr value of public instance"
    type = string
  
}
variable "public-ip-decision" {
   description = "this block determine whether to assign public ip or not"
    type = bool
  
}
variable "public-instance-type" {
    description = "this block decides the instance type"
    type = string
  
}
variable "private-instance-type" {
    description = "this block decides the instance type"
    type = string
  
}