terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      Name        = var.tag_name,
      GitRepo     = var.tag_gitrepo
      Environment = var.tag_environment
    }
  }
}
