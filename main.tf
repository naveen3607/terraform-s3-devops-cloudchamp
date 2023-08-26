#Create S3 Bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}