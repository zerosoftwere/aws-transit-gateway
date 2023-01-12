variable "AMI" {
  description = "Amazon machine image"
  type        = string
  default     = "ami-03a45a5ac837f33b7"
}

variable "SSH_PUBLIC_KEY" {
  description = "SSH key location"
  type        = string
}