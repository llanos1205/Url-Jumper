data "aws_elastic_beanstalk_hosted_zone" "current" {}
data "aws_acm_certificate" "acm_certificate" {
  domain      = "*.${var.domain_name}"
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}
