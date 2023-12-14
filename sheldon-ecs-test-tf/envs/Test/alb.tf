resource "aws_alb" "main" {
  name            = var.alb_name
  subnets         = data.aws_subnets.public.ids
  security_groups = [data.local_file.alb_sg.content]
}

module "tg_80" {
  source            = "./modules/target-group/"
  port              = 80
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8000" {
  source            = "./modules/target-group/"
  port              = 8000
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_8100" {
  source            = "./modules/target-group/"
  port              = 8100
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8200" {
  source            = "./modules/target-group/"
  port              = 8200
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_8300" {
  source            = "./modules/target-group/"
  port              = 8300
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_8400" {
  source            = "./modules/target-group/"
  port              = 8400
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8500" {
  source            = "./modules/target-group/"
  port              = 8500
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8600" {
  source            = "./modules/target-group/"
  port              = 8600
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8700" {
  source            = "./modules/target-group/"
  port              = 8700
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8800" {
  source            = "./modules/target-group/"
  port              = 8800
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_8900" {
  source            = "./modules/target-group/"
  port              = 8900
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

module "tg_9000" {
  source            = "./modules/target-group/"
  port              = 9000
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_9100" {
  source            = "./modules/target-group/"
  port              = 9100
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_security_groups9200" {
  source            = "./modules/target-group/"
  port              = 9200
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_9300" {
  source            = "./modules/target-group/"
  port              = 9300
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_9400" {
  source            = "./modules/target-group/"
  port              = 9400
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_9500" {
  source            = "./modules/target-group/"
  port              = 9500
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}
module "tg_9600" {
  source            = "./modules/target-group/"
  port              = 9600
  tgname            = var.tgname
  vpc_id            = data.local_file.vpc_main.content
  health_check_path = var.health_check_path
  aws_alb_arn       = aws_alb.main.id
}

data "local_file" "vpc_main" {
  filename = "/var/jenkins_home/workspace/Test_NEWREGION_SHELDON/terraform_repo/vpc_output"
}

data "local_file" "alb_sg" {
  filename = "/var/jenkins_home/workspace/Test_NEWREGION_SHELDON/terraform_repo/alb_sg_output"
}