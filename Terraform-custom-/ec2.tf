resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.subnet.id
    tags = {
      Name ="My EC2"
    }

    associate_public_ip_address = true
    security_groups = [aws_security_group.securitygroup.id]
  
}

resource "aws_instance" "ec2private" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.privatesubnet.id
    tags = {
        Name ="My Private EC2"
    }
    associate_public_ip_address = false
    security_groups = [aws_security_group.securitygroup.id]
  
}