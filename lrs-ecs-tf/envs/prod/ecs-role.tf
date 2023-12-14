resource "aws_iam_role" "ecs_role" {
  name = "${var.cluster_name}-ecs-role"
  path = "/ecs/"

  assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "ecs.amazonaws.com",
                    "ecs-tasks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF

  inline_policy {
    name = "ECS-EC2-ECSRole"

    policy = jsonencode({
      Version = "2012-10-17"
      "Statement" : [
        {
          "Action" : [
            "ec2:AttachNetworkInterface",
            "ec2:CreateNetworkInterface",
            "ec2:CreateNetworkInterfacePermission",
            "ec2:DeleteNetworkInterface",
            "ec2:DeleteNetworkInterfacePermission",
            "ec2:Describe*",
            "ec2:DetachNetworkInterface",
            "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
            "elasticloadbalancing:DeregisterTargets",
            "elasticloadbalancing:Describe*",
            "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
            "elasticloadbalancing:RegisterTargets"
          ],
          "Resource" : "*",
          "Effect" : "Allow"
        }
      ]
    })
  }

  inline_policy {
    name = "ecs_task_execution_policy"

    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "ecr:GetAuthorizationToken",
            "ecr:BatchCheckLayerAvailability",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "*"
        }
      ]
    })
  }
  inline_policy {
    name = "ECS-EC2-CloudWatch"

    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "VisualEditor0",
          "Effect" : "Allow",
          "Action" : [
            "logs:CreateLogStream",
            "logs:GetLogRecord",
            "logs:DescribeLogGroups",
            "logs:DeleteLogGroup",
            "logs:DescribeLogStreams",
            "logs:GetLogEvents",
            "logs:CreateLogGroup",
            "logs:DeleteLogStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "*"
        }
      ]
    })
  }
}

output "app_ecs_role" {
  value = aws_iam_role.ecs_role
}