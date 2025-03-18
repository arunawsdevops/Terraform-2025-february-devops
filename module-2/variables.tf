variable "instance_ami" {
    description = "this holds the AMI value for instance"
    type = string
    default = "ami-08b5b3a93ed654d19"
}

variable "instance-type" {
    description = "this holds the type info of instance"
    type = string
    default = "t2.micro"
}

variable "instance-count" {
    description = "number of instances to be launched"
    type = number
    default = 1
  
}

variable "public-ip" {
    description = "this acts like a button to enable pub ip"
    type = bool
    default = true
  
}