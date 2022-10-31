data "aws_acm_certificate" "acm_certificate" {
  domain      = "*.${var.s3_domain_name}"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}
