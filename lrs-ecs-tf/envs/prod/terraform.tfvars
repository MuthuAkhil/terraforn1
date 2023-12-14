create_module = "true"

# AWS Region Configuration
aws_region = "us-east-1"

app_name   = "lrs"

# Networking configuration
vpc_name            = "i2_vpc"
private_subnet_name = "lms_private_subnet_*"
public_subnet_name  = "lms_public_subnet_*"


# ECS Configuration
cluster_name = "lrs-cluster-prod"

# ECR Configuration
ecr_name_production = "lrs-repo-production"

# ECS Instance Configuration
instance_sg   = ["sg-8025f7e6"]
key_name      = "i2_lms"
instance_type = "t3.medium"

# ASG Configuration
min_size         = "2"
max_size         = "2"
desired_capacity = "2"

# ALB Configuration
alb_sg   = ["sg-f2aa3c95"]
alb_name = "lrs-ecs-prod-alb"
tgname   = "lrs-prod-tg"

##  SSL Configuration
certificate_arn = "arn:aws:acm:us-east-1:019619595878:certificate/332f0cf5-4865-445d-88e6-44dfaa96b7af"
ssl_policy      = "ELBSecurityPolicy-2016-08"

sns_alarm_arn   = "arn:aws:sns:us-east-1:019619595878:Techalpha-group"

access_logs_bucket = "production-elb-logs.simplilearn.com"