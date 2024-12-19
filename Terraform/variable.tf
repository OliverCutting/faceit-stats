variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "tag_name" {
  description = "Name of project"
  type        = string
  default     = "aws-terraform-githubactions"
}

variable "tag_gitrepo" {
  description = "Git repo for project"
  type        = string
  default     = "github.com/OliverCutting/aws-terraform-githubactions"
}

variable "tag_environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}