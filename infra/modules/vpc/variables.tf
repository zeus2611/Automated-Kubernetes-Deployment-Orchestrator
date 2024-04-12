variable "env" {
  description = "Environment name"
  type = string
}

variable "vpc_cidr_block" {
  description = "VPC CIDR (Classless Inter-Domain Routing) block"
  type = string
  default = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones for subnets"
  type = list(string)
}

variable "private_subnets" {
  description = "CIDR ranges for private subnets"
  type = list(string)
}

variable "public_subnets" {
  description = "CIDR ranges for public subnets"
  type = list(string)
}

variable "private_subnets_tags" {
  description = "Tags for private subnets"
  type = map(any)
}

variable "public_subnets_tags" {
  description = "Tags for public subnets"
  type = map(any)
}

