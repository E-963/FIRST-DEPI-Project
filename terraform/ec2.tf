#General a new SSH key pair

resource "aws_key_pair" "EC2_key_pair_01" {
  key_name   = "rsa-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "demo" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "rsa-ssh-key"
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.name]

  tags = {
    Name = "demo"
  }
}

resource "aws_instance" "test" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "rsa-ssh-key"
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.name]

  tags = {
    Name = "test"
  }
}

resource "aws_instance" "inst" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "rsa-ssh-key"
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.name]

  tags = {
    Name = "inst"
  }
}
