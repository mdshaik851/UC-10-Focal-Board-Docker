variable "region" {
  default = "us-west-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet" {
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zone" {
  default     = ["us-west-1a", "us-west-1b"]
}

variable "private_subnet" {
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  default     = "t2.medium"
}

variable "ami_id" {
  default = "ami-014e30c8a36252ae5"
}