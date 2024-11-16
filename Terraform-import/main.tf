provider "aws" {
  
}

resource "aws_instance" "name" {

    ami           = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    key_name      = "Thanks"

    tags = {
        Name ="AWSPractice"
    }
  
}