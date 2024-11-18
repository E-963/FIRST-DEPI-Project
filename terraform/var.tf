variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for Ubuntu 24.04"
  type        = string
  default     = "ami-04a81a99f5ec58529"
}
