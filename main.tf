provider "aws"{
access_key="AKIAQTKQW4RXXPC2LA6M"
secret_key="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"
region="us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  count=1
  tags = {
    Name = "Machine-${count.index}"
  }
}

