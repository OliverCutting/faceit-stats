terraform {
  backend "s3" {
    bucket  = "oliver-cutting-terraform-state"
    region  = "eu-west-2"
    key     = "lamp-stack.tfstate"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Name        = var.tag_name,
      GitRepo     = var.tag_gitrepo
      Environment = terraform.workspace
    }
  }
}
