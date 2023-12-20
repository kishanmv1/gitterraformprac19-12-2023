resource "aws_instance" "abhi_terraform_server" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
  subnet_id     = aws_subnet.terraform_subnet1.id
  key_name      = "mac_keypair"
  vpc_security_group_ids = ["${aws_security_group.terraform_sg.id}"]

  
}

