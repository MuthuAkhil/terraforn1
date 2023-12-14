provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "simpli-terraform-state-dev"
    key    = "lrs-ecs/QA-terraform.tfstate"
    region = "us-east-2"
  }
}