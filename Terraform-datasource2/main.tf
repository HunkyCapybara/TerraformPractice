provider "aws"{

}

data "aws_vpc" "vpc" {
    filter {
      name = "tag:Name"
      values = ["vpc"]
    }

}

data "aws_subnet" "subnet" {
    filter {
      name = "tag:Name"
      values = ["subnet"]
    }
  
}

resource "aws_security_group" "securitygroup" {
    name = "allow tls"
    vpc_id = data.aws_vpc.vpc.id
    tags = {
      Name = "aws_security_group"
    }

    ingress {
        description = "TLDLS from VPC"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {
        description = "TLS from VPC"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_instance" "ec2" {
    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    key_name = "Thanks2"
    subnet_id = data.aws_subnet.subnet.id
    security_groups = [aws_security_group.securitygroup.id]
    tags ={
        Name = "ec2-instance"
    }
  
}