resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.url
  type    = var.type

  alias {
    name                   = var.alias_name
    zone_id                = var.zone_id
    evaluate_target_health = false
  }
}

# resource "aws_route53_record" "www-a" {
#   zone_id = data.aws_route53_zone.main.zone_id
#   name    = "www.${var.domain_name}"
#   type    = "A"

#   alias {
#     name                   = var.www_s3_distribution_domain_name
#     zone_id                = var.www_s3_distribution_hosted_zone_id
#     evaluate_target_health = false
#   }
# }
