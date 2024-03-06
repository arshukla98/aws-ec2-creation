variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "AWS EC2 Instance Type"
  type        = string
}

variable "ami" {
  description = "AWS EC2 Instance Image"
  type        = string
}

variable "name" {
  description = "AWS EC2 Instance Name"
  type        = string
}

variable "ssh_ingress_cidr_blocks" {
  description = "CIDR blocks for SSH ingress."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "public_key_path" {
  description = "The path to the public key file."
  type        = string
  default     = "~/.ssh/id_rsa_1.pub"
}
