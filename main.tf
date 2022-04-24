terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

terraform {
  backend "s3" {
    bucket = "kchim-test-tf"
    key    = "app-state-example"
    region = "eu-west-1"
  }
}

provider "aws" {
  profile = "default"
  region = "eu-west-1"
}


resource "aws_instance" "app_server" {
  ami = "ami-00000acccc22bb8f3"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

resource "aws_s3_bucket" "kchim-example-bucket" {
  bucket  = "kchim-example-bucket"
  acl     = "private"
  tags   = {
      Name = var.bucket_tag
  }
}

resource "aws_s3_bucket" "kchim001-example-bucket" {
  bucket  = "kchim001-example-bucket"
  acl     = "public-read"
  tags   = {
      Name = var.bucket_tag
  }
}
