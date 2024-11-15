provider "aws" {
  
}

resource "aws_instance" "dynamodb" {
    ami = "ami-012967cc5a8c9f891"
    instance_type = "t2.micro"
    key_name = "Thanks2"
    tags = {
      Name = "Thanks2"
    }
  
}