provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source              = ".//Users/kuldeeproy/Desktop/kishan files mac/terraform_folder_2/gitterraformprac19-12-2023"
  ami_value           = "ami-0287a05f0ef0e9d9a"
  instance_type_value = "t2.micro"
  subnet_id_value     = "subnet-0883292f35a0a0afb"
}