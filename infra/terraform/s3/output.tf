output "s3_www_website_endpoint" {
    value = aws_s3_bucket.web_bucket.website_endpoint
}

output "s3_root_website_endpoint" {
    value = aws_s3_bucket.root_bucket.website_endpoint
}