terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 4.0.0"
    }
  }
}

resource "null_resource" "stop_instance" {
  # This resource is just a placeholder to trigger the local-exec provisioner
  provisioner "local-exec" {
    command = "aws ec2 ${var.action}-instances --instance-ids ${var.instance_id}"
  }
}
