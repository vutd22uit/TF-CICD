variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "ssh_cidr_block" {
  type        = string
  description = "CIDR block allowed to SSH"
}
