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

resource "aws_instance" "instance_to_be_stopped" {
  count         = 0  # Change to 0 to stop the instance
  id            = var.instanceID
}