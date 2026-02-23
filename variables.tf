variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

variable "access_key" {
  description = "AWS access key ID"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS secret access key"
  type        = string
  sensitive   = true
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-04df1508c6be5879e"
}

variable "ssh_public_key" {
  description = "SSH public key to associate with the EC2 instance"
  type        = string
}
