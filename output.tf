output "instance_public_ip" {
    value = aws_instance.ec2_example.public_ip
    description = "the public of ec2 instance"
}
output "instance_private_ip" {
    value = aws_instance.ec2_example.private_ip
    description = "the private ip of ec2 instance"
}
output "security_group_id" {
  value = aws_security_group.sg1
}