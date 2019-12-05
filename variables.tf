variable "create" {
  description = "create sg"
  type        = bool
  default     = false
}

variable "name" {
  description = "name of the sg"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where to create the SG"
  type        = string
  default     = ""
}

variable "create_ingress_rule" {
  description = "create ingress rule?"
  type = bool
  default = true
}

variable "cidr_blocks" {
  description = "list of cidr blocks allowed ingress"
  type        = list(string)
  default     = []
}
