variable "instance_id" {
  description = "The ID of the EC2 instance"
  type        = string
}

variable "action" {
  description = "Action to perform (start/stop/reboot)"
  type        = string
}
