# AWS Region Configuration
aws_region = "ap-south-1"

# ECS Configuration
cluster_name = "ice9-cluster-qa"
app_name = "ice9"
# Networking configuration
vpc_name            = "i20-staging-vpc"
private_subnet_name = "i20-staging-private*"
public_subnet_name  = "i20-staging-public*"
ice9_instance_sg = "sg-0596aab226f527e9c"
ice9_alb_sg      = "sg-06e6061a7601593bb"

# ECR Configuration
ecr_name_testing = "ice9-repo-testing"
ecr_name_staging = "ice9-repo-staging"

alb_name = "ice9-ecs-qa-alb"
tgname   = "ice9-qa-tg" #Target group

key_name      = "Docker-Staging"
instance_type = "t3.large"

# ASG Configuration
min_size         = "1"
max_size         = "2"
desired_capacity = "1"

##  SSL Configuration
certificate_arn = "arn:aws:acm:ap-south-1:249437634744:certificate/072decff-9913-43bf-b9b7-848bdf16e83c"
ssl_policy      = "ELBSecurityPolicy-2016-08"

health_check_path = "/"
create_module     = "true"