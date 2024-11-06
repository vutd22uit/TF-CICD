# Public EC2 Instance trong Public Subnet
resource "aws_instance" "public_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "Public EC2 Instance"
  }
}

# Private EC2 Instance trong Private Subnet
resource "aws_instance" "private_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.private_sg_id]
  associate_public_ip_address = false

  tags = {
    Name = "Private EC2 Instance"
  }
}

