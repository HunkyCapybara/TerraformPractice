resource "aws_s3_bucket" "name" {
    bucket = "s3statefileconfiguration"
    force_destroy = true
  
}
resource "aws_dynamodb_table" "dynamodbforstatelock" {
    name = "seconddynamodb"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20
    attribute {
        name = "LockID"
        type = "S"
    }
}
  
