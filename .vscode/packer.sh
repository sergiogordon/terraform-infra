{
  "builders": [
    {
      "type": "amazon-ebs",
      "region": "us-east-1",
      "source_ami": "ami-08c40ec972c556486",  # Replace with your desired base AMI
      "instance_type": "t2.micro",
      "ami_name": "my-linux-ami-{{timestamp}}",
      "ssh_username": "ubuntu",  # Or your Linux user
      "ssh_password": "your_password",  # Replace with a secure password
      "run_command": [
        "sudo apt-get update",
        "sudo apt-get install -y nginx git python3 python3-pip",
        "sudo usermod -aG sudo ubuntu"
      ]
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "echo '#!/bin/bash' > /home/ubuntu/install.sh",
        "echo 'apt-get update' >> /home/ubuntu/install.sh",
        "echo 'apt-get install -y vim' >> /home/ubuntu/install.sh",
        "echo 'echo \"Welcome to my EC2 instance!\" > /home/ubuntu/welcome.txt' >> /home/ubuntu/install.sh",
        "chmod +x /home/ubuntu/install.sh",
        "/home/ubuntu/install.sh"
      ]
    }
  ]
}
