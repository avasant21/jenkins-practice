# EC2 Instance Output
output "EC2-INSTANCE-ID" {
  value     = module.EC2.EC2-INSTANCE-ID
}

output "EC2-INSTANCE-PRI-IP" {
  value     = module.EC2.EC2-INSTANCE-PRI-IP
}

output "EC2-INSTANCE-PUB-IP" {
  value     = module.EC2.EC2-INSTANCE-PUB-IP
}

# Security Group ID
output "SGID" {
  value     = module.SG.SGID
}