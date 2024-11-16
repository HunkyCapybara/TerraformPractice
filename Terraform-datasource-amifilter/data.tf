data "aws_ami" "aminewimage" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "root-device-type"
      values = ["ebs"]
    }

    filter {
      name = "architecture"
      values = ["x86_64"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm", "paravirtual",]
    }
  
}

data "aws_security_group" "name" {
    id = "sg-0fa00853b0e529388"
  
}

data "aws_subnet" "names" {
    id = "subnet-07662ff01176f8b92"
  
}