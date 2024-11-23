provider "aws" {
  
}

resource "aws_key_pair" "keypair" {
    public_key = file("~/.ssh/id_ed25519.pub")
    key_name = "thirdkey"

}

resource "aws_instance" "ec2instance" {
    ami           = "ami-06b21ccaeff8cd686"
    instance_type = "t2.micro"
    key_name       = aws_key_pair.keypair.key_name
    tags= {
        Name = "Provisioners"
    }
  
#Connecting through bastion host and giving the private key

connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_ed25519") 
    host = self.public_ip
}


# this creates the file locally
provisioner "local-exec" {
    
    command = "touch file1"
  
}

# this sends the file to the destination from the local to the remote

provisioner "file" {
  source = "file2"
  destination = "/home/ec2-user/file2"

}

#This makes the changes on remote by whatever the commands we give here

provisioner "remote-exec" {
    inline = [
        "touch file3",
        "echo hello from remote >> file3"
    ]
}

}

