variable "region" {
  
}

variable "vpc_cidr" {
  
}

variable "public_subnet" {
  type = list(string)
}

variable "availability_zone" {
  type = list(string)
}

variable "private_subnet" {
  type = list(string)
}