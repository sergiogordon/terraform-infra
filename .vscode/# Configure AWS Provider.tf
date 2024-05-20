# Configure AWS Provider
provider "aws" {
  region = var.region  # Use the 'region' variable
}

# Define Variables
variable "ami_id" {
  type = string
}

variable "region" {
  type = string
  default = "us-east-1"  # Default region if not provided
}

# Create EC2 Instance
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name     = "my-key-pair" # Replace with your key pair name
  tags = {
    Name = "My Web Server"
  }
}

# Output the Public IP Address
output "public_ip" {
  value = aws_instance.web_server.public_ip
}
