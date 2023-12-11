terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test" {
  bucket = "mygh-tf-test-bucket"

  tags = {
    Name        = "My bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.test.id

  block_public_acls       = false

}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.test.id
  key    = "index.html"
  source = "index.html"

}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.test.id

  index_document {
    suffix = "index.html"
  }

}