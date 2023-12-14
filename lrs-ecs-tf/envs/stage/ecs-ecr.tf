resource "aws_ecr_repository" "ecs-ecr-testing" {
  name                 = var.ecr_name_testing
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "ecs-ecr-staging" {
  name                 = var.ecr_name_staging
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

output "app_ecr_repository" {
  value = aws_ecr_repository.ecs-ecr-testing
}