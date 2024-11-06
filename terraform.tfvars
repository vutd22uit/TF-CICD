# File terraform.tfvars tại thư mục root

# Biến cho module VPC
cidr_block         = "10.0.0.0/16"

# Biến cho module Subnets
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

# Biến cho module Security Groups
vpc_id             = "vpc-05866142ad10e479d"  # Giá trị này sẽ được cập nhật tự động từ test module VPC
ssh_cidr_block     = "0.0.0.0/0"

# Biến cho module EC2 Instances
ami               = "ami-0fff1b9a61dec8a5f"
instance_type     = "t2.micro"
public_subnet_id  = ""  # Giá trị này sẽ được cập nhật tự động từ test module Subnets
private_subnet_id = ""  # Giá trị này sẽ được cập nhật tự động từ test module Subnets

# Các biến khác nếu cần cho module NAT Gateway, Route Tables, v.v.
nat_gateway_eip   = ""  # (Giá trị nếu cần)
route_table_id    = ""  # (Giá trị nếu cần)
