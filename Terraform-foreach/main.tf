provider "aws" {

  
}

resource "aws_instance" "name" {

    ami = var.ami_id
    instance_type = var.instance_type
    for_each = toset(var.lebleu)


    tags = {
        Name = each.value
    }
  
}