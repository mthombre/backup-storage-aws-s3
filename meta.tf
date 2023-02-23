terraform {
  required_version = ">= 1.2.0"
  backend "s3" {
    bucket         = "817734494987-backup-storage-aws-s3"
    key            = "infra/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "817734494987-backup-storage-aws-s3"
  }
}