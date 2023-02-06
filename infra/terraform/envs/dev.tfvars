#FRONT END
tf_environment    = "dev"
s3_domain_name    = "llanoscorp.com"
s3_subdomain_name = "dev"
s3_bucket_name    = "dev.llanoscorp.com"
root              = false
#BACK END
vpc_cidr = "10.0.0.0/16"
vpc_subnets_public = [
  
  {
    "id"   = "01",
    "cidr" = "10.0.1.0/24",
    "az"   = "us-east-1a"
  },
  {
    "id"   = "02",
    "cidr" = "10.0.2.0/24",
    "az"   = "us-east-1b"
  },
  {
    "id"   = "03",
    "cidr" = "10.0.3.0/24",
    "az"   = "us-east-1c"
  }
 
]

vpc_subnets_private = [
  
  {
    "id"   = "01",
    "cidr" = "10.0.4.0/24",
    "az"   = "us-east-1a"
  },
  {
    "id"   = "02",
    "cidr" = "10.0.5.0/24",
    "az"   = "us-east-1b"
  },
  {
    "id"   = "03",
    "cidr" = "10.0.6.0/24",
    "az"   = "us-east-1c"
  }
 
]
