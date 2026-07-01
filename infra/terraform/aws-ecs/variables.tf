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

variable "image_uri" {
  type        = string
  description = "Full container image URI."
}

variable "container_port" {
  type        = number
  description = "Container listening port."
  default     = 8080
}

variable "desired_count" {
  type        = number
  description = "Number of ECS tasks."
  default     = 1
}

variable "vpc_id" {
  type        = string
  description = "Existing VPC ID."
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for the load balancer."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for ECS tasks."
}
