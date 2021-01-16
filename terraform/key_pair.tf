resource "aws_key_pair" "KEY-PAIR" {
  key_name      = lower(format("%s-key", var.PROJECT))
  public_key    = file("${path.root}/test-key.pem.pub")
}
