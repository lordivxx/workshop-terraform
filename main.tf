provider "aws" {
  region = var.aws_region
}


module "nodes" {
  source = "./ec2-nodes"

  thecount = 5
}
