provider "aws" {
  region = var.aws_region
}


module "nodes" {
  source = "../../modules/ec2-nodes"

  thecount = 1
}
