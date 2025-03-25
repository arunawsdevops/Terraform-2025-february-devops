output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "The ID of the Security Group"
  value       = aws_security_group.security_group.id
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "ec2_instance_public_ip" {
  description = "The Public IP of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}
