provider "aws" {
  region = "ap-south-1"
}

variable "ecs_ami_id" {
  description = "AMI ID for ECS-Optimized Amazon Linux 2023 (AL2023) x86_64"
  default     = "ami-0bf55744d957f1a3d"
}

data "aws_ami" "ecs_optimized" {
  most_recent = true
  owners      = ["679593333241"] # Owner account ID for AWS Marketplace

  filter {
    name   = "image-id"
    values = [var.ecs_ami_id]
  }
}

# Output the AMI ID
output "ecs_ami_id" {
  value = data.aws_ami.ecs_optimized.id
}