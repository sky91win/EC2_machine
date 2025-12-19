resource "aws_instance" "github_ec2" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = var.instance_type

  tags = {
    Name = "GitHub-Actions-Ubuntu-EC2"
  }
}
