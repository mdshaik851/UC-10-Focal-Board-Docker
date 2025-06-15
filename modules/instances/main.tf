resource "aws_instance" "focalboard_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.security_groups_id_ec2]
  associate_public_ip_address = true
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt-get install -y docker.io
                sudo systemctl start docker
                sudo systemctl enable docker
                sudo usermod -aG docker ubuntu
                sudo docker run -d -p 8000:8000 mattermost/focalboard
            EOF

  tags = {
    Name = "focalboard_instance"
  }
}
