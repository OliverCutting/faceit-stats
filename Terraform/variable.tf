variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "tag_project" {
  description = "Name of project"
  type        = string
  default     = "faceit-stats"
}

variable "tag_gitrepo" {
  description = "Git repo for project"
  type        = string
  default     = "github.com/OliverCutting/faceit-stats"
}

variable "key_path" {
  description = "Path to instance openssh keyS"
  type        = string
  default     = "keys/instance-key"
}