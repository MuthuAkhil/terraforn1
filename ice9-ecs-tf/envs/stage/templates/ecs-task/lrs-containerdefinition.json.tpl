[
    {
        "name": "${SERVICE_NAME}-${SERVICE_PORT}",
        "image": "${ECR_URL}/${DOCKER_REPO_URI}:v${BUILD_NUMBER}",
        "cpu": 256,
        "memory": 256,
        "portMappings": [{
        "containerPort": ${STAGE_CONTAINER_PORT},
        "hostPort": ${STAGE_HOST_PORT}
        }],              
        "essential": true,
        "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
        "awslogs-group": "/ecs/${SERVICE_NAME}-task",
        "awslogs-create-group": "true",
        "awslogs-region": "${STAGE_AWS_REGION}",
        "awslogs-stream-prefix": "ecs"
        }},
        "environment": [
            {
                "name": "Application_Environment",
                "value": "${APPLICATION_ENVIRONMENT}"
            }
        ],
        "mountPoints": [
            {
                "sourceVolume": "logs",
                "containerPath": "/usr/app/lrs/logs"
            }
        ]
        },
        {
        "name": "log_router",
        "image": "${ECR_URL}/${INSIGHTOPS_REPO_URI}:${INSIGHTOPS_TAG}",
        "cpu": 0,
        "memoryReservation": 50,
        "essential": false,
        "pseudoTerminal": true,
        "mountPoints": [
        {
            "sourceVolume": "logs",
            "containerPath": "/usr/app/lrs/logs",
            "readOnly": true
        }
        ]
        }
]