variable "INSTANCE_COUNT" {}
variable "TEMPLATE" {}
variable "INSTANCE_AMI" {}
variable "INSTANCE_TYPE" {
  type    = list(string)
}
variable "KEY_NAME" {}
variable "SG_IDS" {type = list(string)}

# Tags
variable "TAG_PROJECT" {}