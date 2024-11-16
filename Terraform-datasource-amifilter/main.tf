resource "aws_instance" "name" {

    ami = data.aws_ami.aminewimage.id
    instance_type = "t2.micro"
    security_groups = [data.aws_security_group.name.id ]
    subnet_id = data.aws_subnet.names.id
    associate_public_ip_address = true
    tags = {
      Name = "NameOfInstance"
    }
  
}