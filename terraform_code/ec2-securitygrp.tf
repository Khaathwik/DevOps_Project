# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a sample ec2 instance
resource "aws_instance" "test_instance" {
    ami = "ami-0230bd60aa48260c6"
    instance_type = "t2.micro"
    key_name = "tfkey"
}

# Create a Security Group
resource "aws_security_group" "sg1" {
  name        = "sg1"
  description = "SSH access to EC2"

  ingress {
    description      = "SSH access to EC2"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_ssh"
  }
}