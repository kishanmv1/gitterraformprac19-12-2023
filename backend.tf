terraform {
  backend "s3" {
    bucket = "terraformgitprac"
    region = "ap-south-1"
    key = "kishan/terraform.tfstate"
    dynamodb_table = "terraform_lock"
    
  }
}