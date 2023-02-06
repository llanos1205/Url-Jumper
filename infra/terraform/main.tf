module "fronet_end" {
  source            = "./components/front-end"
  tf_environment    = var.tf_environment
  s3_domain_name    = var.s3_domain_name
  s3_subdomain_name = var.s3_subdomain_name
  root     = var.root
}
