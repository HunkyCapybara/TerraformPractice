terraform {
  backend "s3" {
    bucket = "s3statefileconfiguration"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "seconddynamodb"
    encrypt = true
  
    
  }
}