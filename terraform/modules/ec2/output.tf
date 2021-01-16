# EC2 Instance Output Information
output "EC2-INSTANCE-ID" {
  value       = aws_instance.EC2-INSTANCE.*.id
}

output "EC2-INSTANCE-PRI-IP" {
  value       = aws_instance.EC2-INSTANCE.*.private_ip
}

output "EC2-INSTANCE-PUB-IP" {
  value       = aws_instance.EC2-INSTANCE.*.public_ip
}