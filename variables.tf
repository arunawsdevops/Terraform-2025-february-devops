variable "os-name" {
    default ="ami-05716d7e60b53d380"
}

variable "key-name" {
    default ="new-key"
}

variable "instance-type" {
    default ="t2.micro"
}
variable "vpc-cidr" {
default ="10.0.0.0/16"
}
variable "subnet1-cidr" {
    default="10.0.1.0/24"
}
