output "s3_www_website_endpoint" {
  value = aws_s3_bucket_website_configuration.web_bucket_webconfig.website_endpoint
}
