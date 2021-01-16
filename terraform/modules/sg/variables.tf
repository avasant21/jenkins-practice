# Security Group Configuration
variable "VPC_ID" {}
variable "SG_NAME" {}
variable "FROM_PORT" {
  type    = list(number)
  default = []
}
variable "TO_PORT" {
  type    = list(number)
  default = []
}
variable "PROTOCOL" {
  type    = string
}
variable "INGRESS_SOURCE" {
  type    = list(string)
}