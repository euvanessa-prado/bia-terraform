terraform {
    required_providers {
       aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }

    }
    required_version = ">= 1.3.0"

}

provider "aws" {
    region = "us-east-1"
    profile = "bia"  
}

resource "aws_security_group" "bia-dev" {
  name        = "bia-dev-tf"
  description = "Regra para a instancia de trabalho bia-dev-tf"
  vpc_id      = "vpc-0d6774d8052299f6c"

  ingress {
    description      = "Liberado 3001 para o mundo"
    from_port        = 3001
    to_port          = 3001 
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "bia-terraform" {
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t3.micro"
  tags = {
    ambiente = "producao"
    Name     = "bia-terraform"
  }
  vpc_security_group_ids = [aws_security_group.bia-dev.id]
  root_block_device {
    volume_size = 10
  }
}