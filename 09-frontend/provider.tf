terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
  backend "s3" {
    bucket = "daws78ss-cloud"
    key    = "expense-dev-frontend"
    region = "us-east-1"
    dynamodb_table = "daws78ss-cloud"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}