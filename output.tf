output "public_i_pub_ip" {
    value = aws_instance.myserver-pub-ec2[0].public_ip
    description = "This block prints pub ip of pub instance"
}