variable "PROJECT" {
  type        = string
  default     = "milindtech"
  description = "Name of the project"
}

variable "AMI_PREFIX" {
  type        = string
}

variable "INSTANCE_TYPE" {
  type = list(string)
  default      = ["t2.medium"]
}

variable "INSTANCE_COUNT" {
  type        = number
  default     = 1
}

variable "SOURCE_CIDR" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
