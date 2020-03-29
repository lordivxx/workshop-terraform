variable "public_key_path" {
  default = "~/.ssh/terraform.pub"
}

variable "private_key_path" {
  default = "~/.ssh/terraform"
}

variable "connection_type" {
  default = "ssh"
}

variable "connection_username" {
  default = "ec2-user"
}

variable "key_name" {
  default = "workshop-terraform-key"
}

variable "aws_region" {
  default     = "us-west-1"
}


variable "aws_amis" {
  default = {
    eu-west-1 = "ami-674cbc1e"
    us-east-1 = "ami-1d4e7a66"
    us-west-1 = "ami-09a7fe78668f1e2c0"
    us-west-2 = "ami-8803e0f0"
  }
}

