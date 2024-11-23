provider "aws" {
  
}

resource "aws_key_pair" "keypair" {
    key_name = "first_key"
    public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "server" {
    ami = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    key_name = aws_key_pair.keypair.key_name
}