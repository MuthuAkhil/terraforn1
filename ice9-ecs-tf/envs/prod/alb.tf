resource "aws_alb" "main" {
  name            = var.alb_name
  subnets         = data.aws_subnets.public.ids
  security_groups = [var.ice9_alb_sg]

  access_logs {
    bucket  = var.access_logs_bucket
    prefix  = var.alb_name
    enabled = true
  }
}


module "tg_80" {
  source            = "./modules/target-group/"
  port              = 80
  tgname            = var.tgname
  vpc_id            = data.aws_vpc.vpc.id
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn
}