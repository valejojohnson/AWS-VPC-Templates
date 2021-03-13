#----------------------------------- Variables for Module ---------------------------------------#
variable "vpc_cidr" {
  default     = "10.103.134.0/24"
  description = "This is the default VPC CIDR for the VPC being created"
}

variable "prefix" {
  default     = "[Default]"
  description = "Typically this is the Environment in the resources are being built"
}

variable "company-name" {
  default     = "dev"
  description = "The name of the studio or company the resources are being built for"
}

variable "private_cidr" {
  default = ["10.103.134.0/27", "10.103.134.32/27", "10.103.134.64/27", "10.103.134.96/27"]
}

variable "public_cidr" {
  default = ["10.103.134.128/27", "10.103.134.160/27", "10.103.134.192/27", "10.103.134.224/27"]
}
