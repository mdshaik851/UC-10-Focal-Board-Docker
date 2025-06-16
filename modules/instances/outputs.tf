output "instance_id" {
  value = aws_instance.focalboard_instance.id
}

output "instance_arn" {
  value = aws_instance.focalboard_instance.arn
}

output "instance_type_latest" {
  value = aws_instance.focalboard_instance.instance_type
}