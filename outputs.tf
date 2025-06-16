output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "instance_type" {
  value = module.focal_board_instance.instance_type_latest
}

output "vpc_id" {
  value = module.vpc.vpc_id_details
}