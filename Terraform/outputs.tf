output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.test-vm-2.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.test-vm-2.public_ip
}

output "instance_public_dns" {
  description = "Public IPv4 DNS of the EC2 instance"
  value       = aws_instance.test-vm-2.public_dns
}

output "aws_security_group_name" {
  description = "Name of the AWS Security Group"
  value       = aws_security_group.new_security_group.name
}

output "aws_key_pair_name" {
  description = "Name of the AWS Key Pair"
  value       = aws_key_pair.example_key_pair.key_name
}
