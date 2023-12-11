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
  acl = "private"
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
  acl = "public-read"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.test.id

  index_document {
    suffix = "index.html"
  }

}

/* resource "aws_s3_bucket_policy" "public-acces" {
    bucket = aws_s3_bucket.test.id

    policy = <<EOF
    {
            "Version": "2012-10-17",
            "Id": "Policy1699337655601",
            "Statement": [
            {
                "Sid": "Stmt1699337635049",
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::mygh-tf-test-bucket/*"
            }
        ]
    }
    EOF
} */