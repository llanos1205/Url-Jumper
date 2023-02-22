output "ebsk_dns_name" {
  value = aws_elastic_beanstalk_environment.thisenv.cname

}
output "ebsk_zone_id" {
  value = data.aws_elastic_beanstalk_hosted_zone.current.id

}
