variables {
  instance_type = "t2.micro"  # Set the expected instance type
  ami_id        = "ami-014e30c8a36252ae5"
}

run "verify_instance_type" {
  command = plan

  # Assert that the instance type matches what we specified
  assert {
    condition     = module.focal_board_instance.aws_instance.focalboard_instance.instance_type == var.instance_type
    error_message = "Instance type mismatch. Expected ${var.instance_type}, got ${module.focal_board_instance.aws_instance.focalboard_instance.instance_type}"
  }
}