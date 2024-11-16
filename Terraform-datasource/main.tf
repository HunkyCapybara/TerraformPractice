resource "aws_instance" "name" {
  ami = "ami-012967cc5a8c9f891"
  instance_type = "t2.micro"
  security_groups = [data.aws_security_group.name.id]
  subnet_id = data.aws_subnet.names.id
}