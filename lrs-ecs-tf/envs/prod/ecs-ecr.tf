resource "aws_ecr_repository" "ecs-ecr-production" {
  name                 = var.ecr_name_production
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

output "app_ecr_repository" {
  value = aws_ecr_repository.ecs-ecr-production
}