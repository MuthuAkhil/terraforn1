locals {
  name        = "ecs-lrs-app"
  environment = "QA"

  # This is the convention we use to know what belongs to each other
  ec2_resources_name = "${local.name}-${local.environment}"
}

# Create ECS Task and instance Role

module "ec2_profile" {
  source = "../../modules/ecs-instance-profile"

  name = local.name

  tags = {
    Environment = local.environment
  }
}

# Define AMI

data "aws_ami" "amazon_linux_ecs" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}



resource "aws_ecs_cluster" "app_ecs_cluster" {
  name = var.cluster_name
}

module "asg" {
  source = "../../modules/aws-ecs-asg/"

  name = var.cluster_name

  # Launch configuration
  lc_name                   = var.cluster_name
  image_id                  = data.aws_ami.amazon_linux_ecs.id
  key_name                  = var.key_name
  instance_type             = var.instance_type
  security_groups           = var.instance_sg
  iam_instance_profile_name = module.ec2_profile.iam_instance_profile_id
  user_data = templatefile("${path.module}/templates/user-data.sh", {
    cluster_name = var.cluster_name
  })

  # Auto scaling group
  vpc_zone_identifier       = [for s in data.aws_subnet.subnet_values : s.id]
  health_check_type         = "EC2"
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  wait_for_capacity_timeout = 0
  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
}
