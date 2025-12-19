# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Security Group (SSH allowed)
resource "aws_security_group" "ssh_sg" {
  name        = "github-actions-ssh-sg"
  description = "Allow SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "GitHub-Actions-SSH-SG"
  }
}

# Ubuntu EC2 Instance
resource "aws_instance" "github_ec2" {
  ami                    = "ami-053b0d53c279acc90"   # Ubuntu 22.04 (us-east-1)
  instance_type          = var.instance_type
  key_name               = "daca"
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  tags = {
    Name = "GitHub-Actions-Ubuntu-EC2"
  }
}
