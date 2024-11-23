provider "aws" {
  
}

resource "aws_instance" "lifecycle" {
    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    key_name = "Thanks2"
    availability_zone = "us-east-1b"
    tags = {
        Name = "MyTestEC2Instance"
  
}

# lifecycle {
#   ignore_changes = [ tags, ]
# }

lifecycle {
    create_before_destroy = true
  
}

# lifecycle {
#     prevent_destroy = true
#   }


}