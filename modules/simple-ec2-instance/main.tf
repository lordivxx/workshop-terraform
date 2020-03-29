
resource "aws_instance" "simple-ec2" {
  ami           = "ami-0c49b0cde84c02ad2"
  instance_type = "t2.micro"


  provisioner "local-exec" {
    command = "echo ${aws_instance.simple-ec2.public_ip} > ip_address.txt"
  }

}

