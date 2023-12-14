create_module = "true"

# AWS Region Configuration
aws_region = "ap-south-1"

# Networking configuration
vpc_name            = "i20-staging-vpc"
private_subnet_name = "i20-staging-private*"
public_subnet_name  = "i20-staging-public*"


# ECS Configuration
cluster_name = "lrs-cluster-qa"

# ECR Configuration
ecr_name_testing = "lrs-repo-testing"
ecr_name_staging = "lrs-repo-staging"

# ECS Instance Configuration
instance_sg   = ["sg-0596aab226f527e9c"]
key_name      = "Docker-Staging"
instance_type = "t3.medium"

# ASG Configuration
min_size         = "1"
max_size         = "2"
desired_capacity = "1"

# ALB Configuration
alb_sg   = ["sg-06e6061a7601593bb"]
alb_name = "lrs-ecs-qa-alb"
tgname   = "lrs-qa-tg"

##  SSL Configuration
certificate_arn = "arn:aws:acm:ap-south-1:249437634744:certificate/072decff-9913-43bf-b9b7-848bdf16e83c"
ssl_policy      = "ELBSecurityPolicy-2016-08"

# SNS Configuration
sns_alarm_arn="arn:aws:sns:ap-south-1:249437634744:DevOps-Mumbai"