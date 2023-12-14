# AWS Region Configuration
aws_region = "us-east-1"

# ECS Configuration
cluster_name = "ice9-cluster-prod"
app_name = "ice9"
# Networking configuration
vpc_name            = "i2_vpc"
private_subnet_name = "lms_private_subnet_*"
public_subnet_name  = "lms_public_subnet_*"
ice9_instance_sg = "sg-8025f7e6"
ice9_alb_sg      = "sg-f2aa3c95"

# ECR Configuration
ecr_name_production = "ice9-repo-production"

alb_name = "ice9-ecs-prod-alb"
tgname   = "ice9-prod-tg" #Target group

key_name      = "i2_lms"
instance_type = "t3.large"

# ASG Configuration
min_size         = "2"
max_size         = "4"
desired_capacity = "2"

##  SSL Configuration
certificate_arn = "arn:aws:acm:us-east-1:019619595878:certificate/332f0cf5-4865-445d-88e6-44dfaa96b7af"
ssl_policy      = "ELBSecurityPolicy-2016-08"

health_check_path = "/"
create_module     = "true"

sns_alarm_arn   = "arn:aws:sns:us-east-1:019619595878:Techalpha-group"

access_logs_bucket = "production-elb-logs.simplilearn.com"