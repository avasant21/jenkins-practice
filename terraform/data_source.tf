# AMI Lookup
data "aws_ami" "MT_APP" {
  most_recent = true
  filter {
    name      = "name"
    values    = ["mtapp-*"]
  }
}

# VPC Lookup
data "aws_vpc" "VPC_ID" {
  default     = true
}