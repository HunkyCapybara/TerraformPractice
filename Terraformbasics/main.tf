resource "aws_instance" "anyname" {

    ami = "ami-063d43db0594b521b"
    instance_type = "t2.micro"
    key_name = "Thanks"
    tags = {
      
        name = "Terraform"
  }
  
}