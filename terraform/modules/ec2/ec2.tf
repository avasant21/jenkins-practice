# Resource Creation
# cloud init to setup
data "template_file" "BOOTSTRAP-SCRIPT" {
  count         = var.INSTANCE_COUNT
  template      = var.TEMPLATE
  vars = {
    HOST_NAME   = lower(format("%s-web%02d", var.TAG_PROJECT, count.index + 1))
  }
}

data "template_cloudinit_config" "CLOUDINIT" {
  count         = var.INSTANCE_COUNT
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.BOOTSTRAP-SCRIPT.*.rendered[count.index]
  }
}

# Deploy a EC2 Instance
resource "aws_instance" "EC2-INSTANCE" {
  count                  = var.INSTANCE_COUNT
  ami                    = var.INSTANCE_AMI
  instance_type          = var.INSTANCE_TYPE[count.index]
  key_name               = var.KEY_NAME
  vpc_security_group_ids = var.SG_IDS
  user_data              = data.template_cloudinit_config.CLOUDINIT.*.rendered[count.index]

  tags = {
    Name      = lower(format("%s-web%02d", var.TAG_PROJECT, count.index + 1))
    Project   = var.TAG_PROJECT
  }
  volume_tags = {
    Name      = lower(format("%s-web%02d", var.TAG_PROJECT, count.index + 1))
    Project   = var.TAG_PROJECT
  }
}
