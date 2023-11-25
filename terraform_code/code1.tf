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