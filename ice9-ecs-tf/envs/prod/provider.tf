provider "aws" {
  //profile = var.profile
  //shared_credentials_file = "/root/.aws/credentials"  
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket  = "simpli-terraform-prod"    
    key     = "ice9-ecs/PROD-terraform.tfstate"
    region  = "us-east-1"
  }
}