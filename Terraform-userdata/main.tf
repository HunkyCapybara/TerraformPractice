provider "aws" {
  
}

resource "aws_instance" "ec2instance" {
     ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    key_name = "Thanks2"
    user_data = file("test.sh")
    tags = {
        Name = "MyTestEC2Instance"
    }
  
}