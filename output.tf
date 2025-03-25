output "public_ip_of_my_instance" {
description = "this is the public ip"
value=aws_instance.my-instance.public_ip
}
output "private_ip_of_my_instance" {
description = "this is the private ip"
value = aws_instance.my-instance.private_ip
}
