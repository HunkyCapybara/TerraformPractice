
resource "aws_s3_bucket" "ec2" {
    bucket = "shdoehoqeej"
  
}

resource "aws_s3_bucket" "name" {
    bucket = "shdoehoqeejname"
    provider = aws.India
}
  
