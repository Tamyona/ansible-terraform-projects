terraform {
  backend "s3" {
    bucket    = "project-tamyona"
    key       = "terraform.tfstate"
    region    = "us-east-2"
  }
}

# Following lines automatically create S3 bucket
# resource "aws_s3_bucket" "example" {
#   bucket = "project-tamyona"
# }

# resource "aws_s3_object" "object" {
#   depends_on = [aws_s3_bucket.example]
#   bucket = aws_s3_bucket.example.bucket
#   key    = "terraform.tfstate"
#   source = "terraform.tfstate"
# }