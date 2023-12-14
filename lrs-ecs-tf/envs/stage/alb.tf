resource "aws_alb" "main" {
  name            = var.alb_name
  subnets         = data.aws_subnets.public.ids
  security_groups = var.alb_sg
}

module "tg_80" {
  source            = "./modules/target-group/"
  port              = 80
  tgname            = var.tgname
  vpc_id            = data.aws_vpc.vpc.id
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8000" {
  source            = "./modules/target-group/"
  port              = 8000
  tgname            = var.tgname
  vpc_id            = data.aws_vpc.vpc.id
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_8100" {
  source            = "./modules/target-group/"
  port              = 8100
  tgname            = var.tgname
  vpc_id            = data.aws_vpc.vpc.id
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8200" {
  source            = "./modules/target-group/"
  port              = 8200
  tgname            = var.tgname
  vpc_id            = data.aws_vpc.vpc.id
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_8300" {
  source            = "./modules/target-group/"
  port              = 8300
  tgname            = var.tgname
  vpc_id            = data.aws_vpc.vpc.id
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_8400" {
  source            = "./modules/target-group/"
  port              = 8400
  tgname            = var.tgname
  vpc_id            = data.aws_vpc.vpc.id
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}