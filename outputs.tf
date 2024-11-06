output "vpc_id" {
  description = "ID của VPC được tạo"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "ID của Public Subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "ID của Private Subnet"
  value       = module.vpc.private_subnet_id
}

output "internet_gateway_id" {
  description = "ID của Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID của NAT Gateway"
  value       = module.nat_gateway.nat_gateway_id
}

output "public_instance_id" {
  description = "ID của Public EC2 instance"
  value       = module.ec2.public_instance_id
}

output "private_instance_id" {
  description = "ID của Private EC2 instance"
  value       = module.ec2.private_instance_id
}

output "public_sg_id" {
  description = "ID của Security Group công khai"
  value       = module.security_groups.public_sg_id
}

output "private_sg_id" {
  description = "ID của Security Group riêng tư"
  value       = module.security_groups.private_sg_id
}
