#provider "aws" {
#  region = var.aws_region
#}
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

module "gcpnodes" {
  source = "./examples/gcp"

  thecount = 1
}


#module "tier-two" {
#  source = "./modules/two-tier-website"
#
#  thecount = "3"
#}

