terraform {
  backend "s3" {
    bucket       = "uc-10-focal-board"
    key          = "terraform.tfstate"
    region       = "us-west-1"
    
  }
}