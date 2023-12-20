/*resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform_lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockId"

    attribute {
      name = "LockId"
      type = "S"
    }
  
}*/