terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_key_pair" "deployer" {
    key_name = var.key_name
    public_key = file("~/.ssh/id_rsa.pub")
}