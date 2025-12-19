resource "aws_instance" "github_ec2" {
  ami           = "ami-053b0d53c279acc90"   # Ubuntu 22.04 LTS (us-east-1)
  instance_type = var.instance_type
  key_name      = "daca"                   # 👈 KEY PAIR ADDED

  tags = {
    Name = "GitHub-Actions-Ubuntu-EC2"
  }
}
