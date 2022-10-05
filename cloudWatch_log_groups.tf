resource "aws_cloudwatch_log_group" "ecs_log_group_service1" {
  name              = "/ecs/${var.task_definition_service1}"
  retention_in_days = 3
}

resource "aws_cloudwatch_log_group" "ecs_log_group_service2" {
  name              = "/ecs/${var.task_definition_service2}"
  retention_in_days = 3
}

resource "aws_cloudwatch_log_group" "ecs_log_group_service3" {
  name              = "/ecs/${var.task_definition_service3}"
  retention_in_days = 3
}