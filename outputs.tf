output "ec2_public_ip" {
  description = "Public IP of Ubuntu EC2"
  value       = aws_instance.github_ec2.public_ip
}
