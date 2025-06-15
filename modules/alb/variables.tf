variable "vpc_id" {
  description = "VPC ID for the ALB and target group"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "focal_instance_id" {
    description = "instance id"
  type        = string
}

variable "security_groups_id_alb" {
  
}