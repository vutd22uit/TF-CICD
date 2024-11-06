
resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc_id  
  # Ingress Rule: Cho phép SSH qua port 22 từ một địa chỉ IP cụ thể
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr_block]  
    description = "Allow SSH from a specific IP address"
  }

  # Egress Rule: Cho phép tất cả lưu lượng outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

}


resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id  # Sử dụng cùng VPC với Public Security Group

  # Ingress Rule: Chỉ cho phép SSH từ Public EC2 Instance
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id]  # Chỉ cho phép kết nối từ Public EC2 Security Group
    description = "Allow SSH from Public EC2 Instance"
  }

  # Egress Rule: Cho phép tất cả lưu lượng outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

}
