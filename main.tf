# Default VPC
data "aws_vpc" "default" {
  default = true
}

# Existing Security Group
data "aws_security_group" "ssh_sg" {
  name   = "github-actions-ssh-sg"
  vpc_id = data.aws_vpc.default.id
}

# Ubuntu EC2
resource "aws_instance" "github_ec2" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = var.instance_type
  key_name               = "daca"
  vpc_security_group_ids = [data.aws_security_group.ssh_sg.id]

  tags = {
    Name = "GitHub-Actions-Ubuntu-EC2"
  }
}
