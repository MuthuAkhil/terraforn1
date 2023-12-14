provider "aws" {
  //profile = var.profile
  //access_key = var.AWS_ACCESS_KEY_ID
  //secret_key = var.AWS_SECRET_ACCESS_KEY
  //shared_credentials_file = "/root/.aws/credentials"  
  region = var.aws_region
}

terraform {
  backend "s3" {
    profile = "default"
    bucket  = "simpli-terraform-state-dev"
    key     = "ice9-ecs/QA-terraform.tfstate" // variable
    region  = "us-east-2"
  }
}