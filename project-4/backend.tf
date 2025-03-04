terraform {
  backend "s3" {
    bucket    = "project-tamyona"
    key       = "terraform.tfstate"
    region    = "us-east-2"
  }
}
