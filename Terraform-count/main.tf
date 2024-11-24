provider "aws" {
  
}


resource "aws_instance" "count2" {

ami = var.ami_id
instance_type = var.instance_type
count = length(var.instance_names)

tags =  {

 Name = var.instance_names[count.index]
}
  
}