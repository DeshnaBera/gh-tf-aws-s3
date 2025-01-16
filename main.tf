provider "aws" {
 region = "us-east-1" 
}

terraform {
  backend "s3" {
    bucket = "tfstate0609"
    key    = "terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "TfStateLock"
  }
}

resource "aws_s3_bucket" "host" {
  bucket = "gh-tf-bucket"
  tags = {
    Name = "My bucket"
  }
  versioning {
    enabled = true
    }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.host.id
  block_public_acls = false

}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.host.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.host.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.host.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
    {
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.host.arn}/*"
      }
    ]
  })
}


output "website_url" {
 value = aws_s3_bucket.host.website_endpoint
}
