variable "aws_region" {
  type        = string
  description = "AWS region."
  default     = "us-east-1"
}

variable "app_name" {
  type        = string
  description = "Application name."
  default     = "personal-devops-env"
}

variable "vpc_id" {
  type        = string
  description = "Existing VPC ID."
}

variable "subnet_id" {
  type        = string
  description = "Public subnet ID for the EC2 instance."
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR allowed to SSH into the instance."
  default     = "0.0.0.0/0"
}

variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
  default     = "t3.micro"
}
