provider "aws" {
  region = var.aws_region
}


module "tier-two" {
  source = "../../modules/two-tier-website"

  thecount = "3"
}

