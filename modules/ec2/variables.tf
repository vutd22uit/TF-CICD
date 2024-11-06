variable "ami" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "Instance type for EC2"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID"
}

variable "private_subnet_id" {
  type        = string
  description = "Private subnet ID"
}

variable "public_sg_id" {
  type        = string
  description = "Security group ID for public instance"
}

variable "private_sg_id" {
  type        = string
  description = "Security group ID for private instance"
}
