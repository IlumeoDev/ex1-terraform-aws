variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "web-sg"
}

variable "vpc_id" {
  description = "ID of the VPC to attach the security group to"
  type        = string
}
