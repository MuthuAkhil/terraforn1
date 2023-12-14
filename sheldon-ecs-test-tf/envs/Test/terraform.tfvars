# AWS Region Configuration
aws_region = "us-west-1"
app_name   = "sheldon_new"
# ECS Configuration
cluster_name = "sheldon-new-cluster-qa"

# Networking configuration
vpc_name            = "i2_vpc*"
private_subnet_name = "lms_public_subnet*"
public_subnet_name  = "lms_private_subnet*"


# ECR Configuration
ecr_name_testing = "sheldon-repo-testing"
ecr_name_staging = "sheldon-repo-staging"

alb_name = "sheldon-ecs-qa-alb"
tgname   = "sheldon-qa-tg" #Target group

key_name      = "Docker-Staging"
instance_type = "t3a.micro"

# ASG Configuration
min_size         = "1"
max_size         = "2"
desired_capacity = "1"

##  SSL Configuration
certificate_arn = "arn:aws:acm:ap-southeast-2:249437634744:certificate/072decff-9913-43bf-b9b7-848bdf16e83c"
ssl_policy      = "ELBSecurityPolicy-2016-08"

health_check_path = "/health-check"
create_module     = "true"

