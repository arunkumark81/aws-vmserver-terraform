provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myvm1" {

  ami = "ami-079b5e5b3971bd10d"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.myvm1sg.id]

  user_data = <<-EOF
                  #!/bin/bash
                  sudo yum install httpd -y
                  sudo systemctl enable httpd --now
                  echo "Welcome to Rathinam Trainers <BR>" | sudo tee /var/www/html/index.html
              EOF
  tags = {
    Name = "webserver1"
    Application = "CRM"

  }
}

resource "aws_security_group" "myvm1sg" {
  name = "mysg1"
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}