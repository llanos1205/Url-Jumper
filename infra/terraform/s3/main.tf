resource "aws_s3_bucket" "web_bucket" {
  bucket = "www.${var.bucket_name}"
  policy = templatefile("./s3/s3-policy.json", { bucket = "www.${var.bucket_name}" })
  tags   = var.common_tags
}
resource "aws_s3_bucket_acl" "web_bucket_aclconfig" {
  bucket = aws_s3_bucket.web_bucket.id
  acl    = "public-read"
}
resource "aws_s3_bucket_cors_configuration" "web_bucket_corsconfig" {
  bucket = aws_s3_bucket.web_bucket.id

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_website_configuration" "web_bucket_webconfig" {
  bucket = aws_s3_bucket.web_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}








resource "aws_s3_bucket" "root_bucket" {
  bucket = var.bucket_name
  policy = templatefile("./s3/s3-policy.json", { bucket = var.bucket_name })
  tags = var.common_tags
}

resource "aws_s3_bucket_acl" "root_bucket_aclconfig" {
  bucket = aws_s3_bucket.root_bucket.id
  acl    = "public-read"
  
}

resource "aws_s3_bucket_website_configuration" "root_bucket_webconfig" {
  bucket                   = aws_s3_bucket.root_bucket.bucket
  redirect_all_requests_to {
    host_name = "https://www.${var.domain_name}"
    protocol = "https"
  }

}
