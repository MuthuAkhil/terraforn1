locals {  
  app_name = "${var.app_name}-prod"
}
# EC2 Alarms

## ASG System Check Notifications

resource "aws_cloudwatch_metric_alarm" "ecs-asg-alert_Has-SystemCheckFailure" {
  alarm_name          = "${local.app_name}-SysCheckFailure"  
  comparison_operator = "GreaterThanOrEqualToThreshold"

  period = "60"
  evaluation_periods = "1"
  datapoints_to_alarm = 1

  # second
  statistic = "Sum"
  threshold = "1"
  alarm_description = ""

  metric_name = "StatusCheckFailed"
  namespace = "AWS/EC2"
  dimensions = {
    AutoScalingGroupName = module.asg.name
  }

  actions_enabled = true
  insufficient_data_actions = []
  ok_actions = []
  alarm_actions     = [var.sns_alarm_arn]
}

## ASG CPU Utilization
resource "aws_cloudwatch_metric_alarm" "EC2_ASG_metric_alarm" {
  alarm_name          = "${local.app_name}-EC2-metric-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "70"
  depends_on = [
    module.asg,
  ]
  dimensions = {
    AutoScalingGroupName = module.asg.name
  }  

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [var.sns_alarm_arn]
}


# ALB Alarms

## Target Response Time
resource "aws_cloudwatch_metric_alarm" "target_response_time_average" {
  alarm_name          = "${local.app_name}-highResponseTime"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Average"
  threshold           = var.response_time_threshold
  alarm_description   = format("Average response time is greater than %s", var.response_time_threshold)
  alarm_actions     = [var.sns_alarm_arn]

  dimensions = {
    "TargetGroup"  = module.tg_80.tg_arn
    "LoadBalancer" = aws_alb.main.id
  }
}

## 5XX Errors
resource "aws_cloudwatch_metric_alarm" "httpcode_lb_5xx_count" {
  alarm_name          = "${local.app_name}-high5XXCount"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "HTTPCode_ELB_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "5XX load balancer error code count is high"
  alarm_actions     = [var.sns_alarm_arn]
  

  dimensions = {
    "LoadBalancer" = aws_alb.main.id
  }
}

## Unhealthy Host Count

resource "aws_cloudwatch_metric_alarm" "unhealthy_hosts" {
  alarm_name          = "${local.app_name}-unhealthy-hosts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Minimum"
  threshold           = 1
  alarm_description   = "Unhealthy host count is greater than 1"
  alarm_actions     = [var.sns_alarm_arn] 

  dimensions = {
    "TargetGroup"  = module.tg_80.tg_arn
    "LoadBalancer" = aws_alb.main.id
  }
}