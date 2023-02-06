locals {
  bucket_url = "${!var.root ? "${var.subdomain_name}." : ""}${var.domain_name}"
}

#WWW BUCKET
resource "aws_s3_bucket" "web_bucket" {
  bucket        = local.bucket_url
  tags          = var.common_tags
  force_destroy = true
}
resource "aws_s3_bucket_acl" "web_bucket_aclconfig" {
  bucket = aws_s3_bucket.web_bucket.id
  acl    = "public-read"
}
resource "aws_s3_bucket_cors_configuration" "web_bucket_corsconfig" {
  bucket = aws_s3_bucket.web_bucket.id
  for_each = toset(var.root ? [] : ["token"])
  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.subdomain_name}.${var.domain_name}"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_website_configuration" "web_bucket_webconfig" {
  bucket = aws_s3_bucket.web_bucket.bucket

  dynamic "index_document" {
    for_each = toset(var.root ? [] : ["token"])
    content {
      suffix = "index.html"
    }

  }

  dynamic "error_document" {
    for_each = toset(var.root ? [] : ["token"])
    content {
      key = "index.html"
    }

  }

  dynamic "redirect_all_requests_to" {
    for_each = toset(var.root ? ["token"] : [])
    content {
      host_name = "https://${var.subdomain_name}.${var.domain_name}"
      protocol  = "https"
    }

  }
}

resource "aws_s3_bucket_policy" "www_allow_access_from_cloudfront" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = templatefile("${path.module}/s3-policy.json", { bucket = local.bucket_url })
}
