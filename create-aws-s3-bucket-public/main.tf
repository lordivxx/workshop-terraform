provider "aws" {
  region = var.aws_region
}

module "website_s3_bucket" {
  source = "../modules/aws-s3-static-website-bucket"

  bucket_name = "ivxx-workshop-test-2703202002"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

