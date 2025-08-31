resource "aws_security_group" "bia_dev" {
  name        = "bia-dev"
  description = "acesso do bia dev"
  vpc_id      = "vpc-0d6774d8052299f6c"

  ingress {
    description      = "acesso para o mundo"
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

}