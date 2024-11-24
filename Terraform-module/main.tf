provider "aws" {
  
}

module "ec2" {

source = "../Terraform-module-child"
ami_id = "ami-0453ec754f44f9a4a"
instance_type = "t2.micro"
name = "Terraform"

}