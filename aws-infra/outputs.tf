output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "ec2_public_ip" {
  description = "This is the public IP of my web server"
  value       = aws_instance.web_server.public_ip
}