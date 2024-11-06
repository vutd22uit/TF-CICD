resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id  # Gán EIP mới tạo cho NAT Gateway
  subnet_id     = var.public_subnet_id
}
