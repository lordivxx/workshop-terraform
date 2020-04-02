provider "aws" {
  region = var.aws_region
}
#
#provider "google" {
#  version = "3.5.0"
#
#  credentials = file("~/terraform-ccabb4d682e8.json")
#
#  project = "terraform-272703"
#  region  = "us-central1"
#  zone    = "us-central1-c"
#}

#module "awsnodes" {
#  source = "./modules/ec2-nodes"
#
#  thecount = 1
#}

#module "gcpnodes" {
#  source = "./examples/gcp"
#
#  thecount = 1
#}

#module "website_s3_bucket" {
#  source = "./modules/aws-s3-static-website-bucket"
#
#  bucket_name = "ivxx2020040101"
#
#  tags = {
#    Terraform   = "true"
#    Environment = "dev"
#  }
#}

#module "tier-two" {
#  source = "./modules/two-tier-website"
#
#  thecount = "3"
#}

