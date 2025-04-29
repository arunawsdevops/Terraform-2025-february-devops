     variable "vpc_cidr" {
       description = "The CIDR block for the VPC"
       type = string
       default = "10.0.0.0/16"
     }
     variable "aws_s3_bucket"{
        type = string
        default = "renjith-buket-123-devops"
     }