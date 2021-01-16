# AMI Lookup
data "aws_ami" "MT_APP" {
  most_recent = true
  owners      = ["self"]
  filter {
    name      = "name"
    values    = [format("%s-*", var.AMI_PREFIX)]
  }
}

# VPC Lookup
data "aws_vpc" "VPC_ID" {
  default     = true
}
