terraform {
  backend "s3" {
    bucket         = "817734494987-backup-storage-aws-s3"
    key            = "10_oidc/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "817734494987-backup-storage-aws-s3"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

