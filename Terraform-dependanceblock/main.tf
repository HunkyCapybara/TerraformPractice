provider "aws" {
  
}

resource "aws_instance" "name" {
    ami           = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    key_name     = "Thanks2"

    tags = {
      name = "<name"
    }

}

resource "aws_s3_bucket" "names" {

    bucket = "hwbcekcnweknc"
    depends_on = [ aws_instance.name ]
  
}