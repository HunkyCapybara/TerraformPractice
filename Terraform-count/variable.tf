variable "ami_id" {
    type = string
    default = "ami-012967cc5a8c9f891"
  
}

variable "instance_type" {

    type = string
    default = "t2.micro"
  
}

variable "instance_names" {

    type = list(string)
    default = [ "dev","production" ]
  
}

