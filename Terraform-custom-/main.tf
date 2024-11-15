#Creating a new VPC
resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "My VPC"
    }
}
  
#Creating internet gateway 
resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = "ig"
    }
  
}

# Creating subnet
resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name= "Internet gateway"
    }
  
}

#Creating route table and attaching it to the Internet gateway
resource "aws_route_table" "routetable" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ig.id
    }
}

# Subnet association in the route table
resource "aws_route_table_association" "association" {
    
    route_table_id = aws_route_table.routetable.id
    subnet_id = aws_subnet.subnet.id
  
}

resource "aws_security_group" "securitygroup" {
    name = "securitygroup"
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "securitygroup"
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
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

    resource "aws_eip" "Elasticip" {
      
    }
  
  resource "aws_nat_gateway" "natgateway" {
    allocation_id = aws_eip.Elasticip.id
    subnet_id = aws_subnet.subnet.id

    tags ={
        Name = "natgateway"
    }
  }

  #Creation of private route table
  resource "aws_route_table" "privateroute" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.natgateway.id
    }
    
  }






  #Creation of private subnet
  resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block =  "10.0.1.0/24"
    tags = {
        Name = "Private subnet"
    }

    
  }

  #Route table aassociation
  resource "aws_route_table_association" "privatenat" {
    route_table_id = aws_route_table.privateroute.id
    subnet_id = aws_subnet.privatesubnet.id
    
  }

