variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "security_groups_id_ec2" {
  
}