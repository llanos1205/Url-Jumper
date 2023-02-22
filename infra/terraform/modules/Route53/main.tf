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
