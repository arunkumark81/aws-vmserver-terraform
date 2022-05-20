provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myvm1" {

  ami = "ami-079b5e5b3971bd10d"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.myvm1sg.id]
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
}