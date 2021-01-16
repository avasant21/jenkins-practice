# Resource Creation
resource "aws_security_group" "SG" {
  name      = var.SG_NAME
  vpc_id    = var.VPC_ID
  tags      = {
    Name    = var.SG_NAME
  }
}

resource "aws_security_group_rule" "SG-RULE-SELF" {
    type                        = "ingress"
    from_port                   = 0
    to_port                     = 0
    protocol                    = "-1"
    source_security_group_id    = aws_security_group.SG.id
    security_group_id           = aws_security_group.SG.id
}

resource "aws_security_group_rule" "SG-RULE-CIDR" {
    count                       = length(var.FROM_PORT)
    type                        = "ingress"
    from_port                   = var.FROM_PORT[count.index]
    to_port                     = var.TO_PORT[count.index]
    protocol                    = var.PROTOCOL
    cidr_blocks                 = var.INGRESS_SOURCE
    security_group_id           = aws_security_group.SG.id
}

resource "aws_security_group_rule" "SG-RULE-EGRESS" {
    type                        = "egress"
    from_port                   = 0
    to_port                     = 0
    protocol                    = "-1"
    cidr_blocks                 = ["0.0.0.0/0"]
    security_group_id           = aws_security_group.SG.id
}
