# ENGX Deployment
module "EC2" {
  source                     = "./modules/ec2"
  INSTANCE_COUNT             = var.INSTANCE_COUNT
  TEMPLATE                   = file("${path.module}/scripts/ec2-bootstrap.sh")
  INSTANCE_AMI               = data.aws_ami.MT_APP.image_id
  INSTANCE_TYPE              = var.INSTANCE_TYPE
  KEY_NAME                   = aws_key_pair.KEY-PAIR.key_name
  SG_IDS                     = [module.SG.SGID]
  TAG_PROJECT                = var.PROJECT
}