
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }
  backend "s3" {
    bucket = "daws78ss-prod"
    key    = "expense-dev-backend"
    region = "us-east-1"
    dynamodb_table = "daws78ss-prod"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}
