output "public_subnet_id" {
  value = aws_subnet.public_subnet[*].id
}

output "vpc_id_details" {
  value = aws_vpc.demo-vpc-uc10.id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "security_group_alb" {
  value = aws_security_group.focal_board_alb.id
}

output "security_group_instance" {
  value = aws_security_group.instance_sg.id
}