variable "ami_id" {
  description = "The id of the instance"
  type = string
}
variable "instance_type" {
    description = "instance type t2.micro"
    type = string
}
variable "instance_count" {
    description = "instance count"
    type = number
}
variable "enable_public_ip" {
    description = "enable public ip"
    type = bool
    default = false 
}
variable "project_environment" {
    description = "project and environment"
    type = map(string)
    default = {
      "name" = "Terra-EC2"
    }  
}
variable "vpc_cidr" {
  description = "vpc cidr"
  type = string
}
variable "subnet_cidr" {
  description = "subnet cidr block"
  type = string
}