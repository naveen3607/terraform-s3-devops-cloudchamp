#Create S3 Bucket
resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.main.id
  key = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.main.id
  key = "error.html"
  source = "error.html"
  content_type = "text/html"
}

resource "aws_s3_object" "profile" {
  bucket = aws_s3_bucket.main.id
  key = "Naveen.jpg"
  source = "Naveen.jpg"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.main.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}