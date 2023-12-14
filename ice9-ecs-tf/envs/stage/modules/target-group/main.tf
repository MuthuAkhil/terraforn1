resource "aws_alb_target_group" "alb_tg" {  
  name        = "${var.tgname}-${var.port}"
  port        = var.port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"
  deregistration_delay = var.deregistration_delay

  health_check {
    healthy_threshold   = "5"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "5"
    path                = var.health_check_path
    unhealthy_threshold = "5"
  }
}

resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = var.aws_alb_arn
  port              = var.port
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.alb_tg.id
    type             = "forward"
  }
  depends_on = [aws_alb_target_group.alb_tg]
}

output "tg_arn" {
  value = aws_alb_target_group.alb_tg.id
}