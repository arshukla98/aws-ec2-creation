terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 4.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "test" {
  byte_length = 8
}

# Create an SSH key pair

resource "aws_key_pair" "example_key_pair" {
  key_name   = "backstage-${random_id.test.id}"
  public_key = file(var.public_key_path) # Replace with the path to your public key file
}

resource "aws_security_group" "new_security_group" {
  name        = "backstage-${random_id.test.id}"

  description = "Allow SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All Traffic
    cidr_blocks = var.ssh_ingress_cidr_blocks
  }

  # You can add more ingress rules as needed for your application
}

resource "aws_instance" "test-vm-2" {
  ami           = var.ami
  instance_type = var.instance_type

  key_name = aws_key_pair.example_key_pair.key_name

  tags = {
    Name = var.name
  }

  vpc_security_group_ids = [ aws_security_group.new_security_group.id ]
}
