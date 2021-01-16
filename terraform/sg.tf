# Security Group Configuration
module "SG" {
  source = "./modules/sg"
  VPC_ID  = data.aws_vpc.VPC_ID.id
  SG_NAME = lower(format("%s-sg",var.PROJECT))
  FROM_PORT        = [22, 80]
  TO_PORT          = [22, 80]
  PROTOCOL         = "tcp"
  INGRESS_SOURCE   = var.SOURCE_CIDR
}