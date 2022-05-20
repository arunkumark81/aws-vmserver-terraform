provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myvm1" {

  ami = "ami-079b5e5b3971bd10d"
  instance_type = "t2.micro"
  tags = {
    Name = "webserver1"
    Application = "CRM"
  }
}