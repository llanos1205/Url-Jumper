terraform {
  backend "s3" {
    bucket         = "url-jumper-terraform-state"
    dynamodb_table = "url-jumper-state-lock"
    key            = ""
    region         = "us-east-1"
  }
}
provider "aws" {
  region  = "us-east-1"
}
