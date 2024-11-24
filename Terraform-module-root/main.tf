provider "aws" {
  
}

module "vpc" {

    source = "../Terraform-module-child/VPC"
    vpc_name = "live-env-vpc"
    cidr_block = "10.0.0.0/16"
    public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

}

module "ec2" {

    source = "../Terraform-module-child/EC2"
    instance_name = "web-server"
    instance_type = "t2.micro"
    ami_id = "ami-0453ec754f44f9a4a"
    subnet_id = module.vpc.public_subnet_ids[0]
  
}