
resource "aws_instance" "bia-terraform" {
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t3.micro"
  tags = {
    ambiente = "producao"
    Name     = var.instance_name
  }
  vpc_security_group_ids = [aws_security_group.bia_dev.id]
  root_block_device {
    volume_size = 10
  }

  iam_instance_profile = aws_iam_instance_profile.role-acesso-ssm.name
  user_data = "${file("user_data_bia_dev.sh")}"
}