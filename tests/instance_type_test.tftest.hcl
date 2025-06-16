variables {
  instance_type = "t2.micro"  # Set the expected instance type
  ami_id        = "ami-014e30c8a36252ae5"
}

run "verify_instance_type" {
  command = plan

  # Assert that the instance type matches what we specified
  assert {
    condition     = module.instances.ec2_instance_tags == var.instance_type
    error_message = "Instance type mismatch. Expected ${var.instance_type}, got ${module.instances.ec2_instance_tags}"
  }
}