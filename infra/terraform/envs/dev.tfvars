tf_environment = "dev"
#FRONT END
domain_name       = "llanoscorp.com"
s3_subdomain_name = "dev"
s3_bucket_name    = "dev.llanoscorp.com"
root              = false
#BACK END
ebsk_subdomain_name = "dev-api"
vpc_name            = "url-jumper"
vpc_cidr            = "10.0.0.0/16"
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
sg_internal_rules = {
  "ingresses" = [
    {
      "desc"        = "allow all internal traffic",
      "source_port" = 0,
      "dest_port"   = 0,
      "protocol"    = "-1",
      "cidrs" = [
        "10.0.0.0/16"
      ]
    },

  ],
  "egresses" = [
    {
      "desc"        = "allow all egress",
      "source_port" = 0,
      "dest_port"   = 0,
      "protocol"    = "-1",
      "cidrs" = [
        "0.0.0.0/0"
      ]
    }
  ]
}
sg_elb_rules = {
  "ingresses" = [
    {
      "desc"        = "allow outside 443",
      "source_port" = 443,
      "dest_port"   = 443,
      "protocol"    = "tcp",
      "cidrs" = [
        "0.0.0.0/0"
      ]
    }
  ],
  "egresses" = [
    {
      "desc"        = "allow all egress",
      "source_port" = 0,
      "dest_port"   = 0,
      "protocol"    = "-1",
      "cidrs" = [
        "0.0.0.0/0"
      ]
    }
  ]
}
ebsk_name          = "url-jumper"
ebsk_desc          = "dev ebsk"
ebsk_instance_type = "t3.micro"
ebsk_max_instances = 1
ebsk_min_instances = 1
