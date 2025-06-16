variable "region" {
  type = string
  default = "us-west-1"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet" {
  type = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zone" {
  type = list(string)
  default     = ["us-west-1a", "us-west-1b"]
}

variable "private_subnet" {
  type = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  type = string
  default     = "t2.medium"
}

variable "ami_id" {
  type = string
  default = "ami-014e30c8a36252ae5"
}