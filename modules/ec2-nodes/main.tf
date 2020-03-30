provider "aws" {
  region = var.aws_region
}

# Create a VPC to launch our instances into
resource "aws_vpc" "default" {
  cidr_block = "10.4.0.0/16"
}

# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
}

# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.default.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

# Create a subnet to launch our instances into
resource "aws_subnet" "default" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.4.20.0/24"
  map_public_ip_on_launch = true
}

resource "aws_key_pair" "workshop-terraform" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}


resource "aws_security_group" "allow_ssh_web" {
  name        = "allow_ssh_web"
  description = "Allow SSH and Web inbound traffic"
  vpc_id = aws_vpc.default.id

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_web"
  }
}




resource "aws_instance" "workshop-instance" {
  key_name      = var.key_name
  ami           = lookup(var.aws_amis, var.aws_region)
  instance_type = "t2.micro"
  count = var.thecount
  subnet_id     = aws_subnet.default.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_web.id]

  connection {
    type        = var.connection_type
    user        = var.connection_username
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

#  provisioner "remote-exec" {
#    inline = [
#      "sudo amazon-linux-extras enable nginx1.12",
#      "sudo yum -y install nginx",
#      "sudo systemctl start nginx",
#      "sudo yum -y install git && sudo rm -rf /usr/share/nginx/html/ && sudo git clone https://github.com/CharlesForsyth/charlesforsyth.github.io.git /usr/share/nginx/html/"
#    ]
#  }

  #provisioner "local-exec" {
  #  command = "echo ${aws_instance.workshop-instance[count.index].public_ip} > ip_address${aws_instance.workshop-instance[count.index]}.txt"
  #}

}

