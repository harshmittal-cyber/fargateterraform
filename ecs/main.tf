resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecsclustername
  tags= var.tags
}

# Create an IAM role for the task execution
resource "aws_iam_role" "harsh_execution_role" {
  name = var.role_name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# Attach policies to the task execution role
resource "aws_iam_role_policy_attachment" "harsh_execution_policy_attach" {
  role       = aws_iam_role.harsh_execution_role.name
  policy_arn = var.policy_arn
}

resource "aws_ecs_task_definition" "harsh_task_definition" {
  family = var.family
  network_mode = var.network_mode
  requires_compatibilities = [var.required_compatability]
  tags=var.tags
  execution_role_arn = aws_iam_role.harsh_execution_role.arn
  cpu= 256
  memory= 512
  container_definitions = <<TASKDEFINITION
    [
      {
        "name": "harsh-container",
        "image": "nginx:latest",
        "portMappings": [
          {
            "containerPort": 80,
            "hostPort": 80,
            "protocol": "tcp"
          }
        ],
        "memory": 512,
        "cpu": 256
      }
    ]
  TASKDEFINITION
}


# Create an ECS service
resource "aws_ecs_service" "my_service" {
  name            = "my-ecs-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.harsh_task_definition.arn
  desired_count   = 1

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = false
  }
}