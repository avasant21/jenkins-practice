variable "PROJECT" {
  type        = string
  default     = "milindtech"
  description = "Name of the project"
}

variable "REGION" {
  type        = string
}

variable "INSTANCE_TYPE" {
  type = list(string)
  default      = ["t2.micro", "t2.nano"]
}

variable "INSTANCE_COUNT" {
  type        = number
  default     = 2
}

variable "SOURCE_CIDR" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}