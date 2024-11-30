resource "aws_instance" "Jenkins" {

    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.medium"
    key_name = "slave"
    user_data = file("jenkins.sh")
    tags ={
        Name = "Jenkins_Terraform"
    }
  
}