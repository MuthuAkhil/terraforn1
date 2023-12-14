data "aws_iam_policy" "required-policy" {
  name = "AmazonECSTaskExecutionRolePolicy"
}


resource "aws_iam_role" "ecs_task_role" {
  name = "${var.app_name}-ecs-task-role"
  path = "/ecs/"

  assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": [                    
                    "ecs-tasks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF

  inline_policy {
    name = "ecs_secretsmanager_policy"

    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "secretsmanager:GetSecretValue",
          "Resource" : "*"
        }
      ]
    })
  }  
}

resource "aws_iam_role_policy_attachment" "attach-task-definition" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = data.aws_iam_policy.required-policy.arn
}


output "app_ecs_task_role" {
  value = aws_iam_role.ecs_task_role
}