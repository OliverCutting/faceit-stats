variable "tag_name" {
  description = "Name of project"
  type        = string
  default     = "Lamp Stack"
}

variable "tag_gitrepo" {
  description = "Git repo for project"
  type        = string
  default     = "github.com/OliverCutting/lamp-stack"
}

variable "tag_environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}