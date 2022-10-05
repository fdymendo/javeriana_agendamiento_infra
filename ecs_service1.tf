resource "aws_ecs_service" "ecs_service1" {
  depends_on = [
    aws_ecs_task_definition.task_definition_service1
  ]
  cluster                            = aws_ecs_cluster.ecs_cluster.arn
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 0
  enable_execute_command             = false
  health_check_grace_period_seconds  = 180
  launch_type                        = "FARGATE"
  name                               = var.service1
  platform_version                   = "LATEST"
  propagate_tags                     = "SERVICE"
  scheduling_strategy                = "REPLICA"
  task_definition                    = var.task_definition_service1

  deployment_circuit_breaker {
    enable   = false
    rollback = false
  }

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    container_name   = var.container_image_service1
    container_port   = var.port_service1
    target_group_arn = aws_lb_target_group.target_group_service1.arn
  }

  network_configuration {
    assign_public_ip = false
    security_groups  = [aws_security_group.alb_to_ecs_tasks_sg.id]
    subnets = module.vpc.private_subnets
  }

  service_registries {
    container_port = 0
    port           = 0
    registry_arn   = aws_service_discovery_service.cm_service1.arn
  }
}
