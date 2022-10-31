s3_domain_name = "llanoscorp.com"
s3_bucket_name = "llanoscorp.com"
tf_environment = "prod"
vpc_cidr       = "10.0.0.0/16"
vpc_subnets = [
  {
    suffix = "public",
    range = [
      {
        "id" = "01",
        "cidr" = "10.0.4.0/24",
        "az"   = "us-east-1a"
      },
      {
        "id" = "02",
        "cidr" = "10.0.5.0/24",
        "az"   = "us-east-1b"
      },
      {
        "id" = "03",
        "cidr" = "10.0.6.0/24",
        "az"   = "us-east-1c"
      }
    ]
  },
  {
    suffix = "private",
    range = [
      {
        "id" = "01",
        "cidr" = "10.0.1.0/24",
        "az"   = "us-east-1a"
      },
      {
        "id" = "02",
        "cidr" = "10.0.2.0/24",
        "az"   = "us-east-1b"
      },
      {
        "id" = "03",
        "cidr" = "10.0.3.0/24",
        "az"   = "us-east-1c"
      }
    ]
  },
]
