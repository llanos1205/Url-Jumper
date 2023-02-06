output "www_dist_domain_name" {
  value = aws_cloudfront_distribution.www_s3_distribution.domain_name
}
output "www_dist_zone_id" {
  value = aws_cloudfront_distribution.www_s3_distribution.hosted_zone_id
}
