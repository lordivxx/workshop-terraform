provider "aws" {
  region = var.aws_region
}

module "website_s3_bucket" {
  source = "../../modules/aws-s3-static-website-bucket"

  bucket_name = "ivxx-workshop-test-2020032903"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

