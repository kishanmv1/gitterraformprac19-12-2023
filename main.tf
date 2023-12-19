resource "aws_instance" "abhi_terraform_server" {
    ami = var.ami_value
    instance_type = var.instance_type_value
    subnet_id = var.subnet_id_value
  
}