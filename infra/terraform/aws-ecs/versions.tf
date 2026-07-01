terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # For production, configure encrypted remote state.
  # backend "s3" {
  #   bucket         = "CHANGE_ME_TF_STATE_BUCKET"
  #   key            = "personal-devops-env/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "CHANGE_ME_TF_LOCK_TABLE"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.aws_region
}
