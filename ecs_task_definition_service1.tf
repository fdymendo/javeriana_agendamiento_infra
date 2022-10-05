resource "aws_ecs_task_definition" "task_definition_service1" {
  depends_on = [
    aws_service_discovery_private_dns_namespace.cloudmap
  ]
  family = var.task_definition_service1
  container_definitions = jsonencode(
    [
      {
        cpu = 0
        dependsOn = [
          {
            condition     = "HEALTHY"
            containerName = "envoy"
          },
        ]
        environment = []
        essential   = true
        image       = "${var.account_id}${var.account_arn_ecr}/${var.ecr_repo_service1}:${var.ecr_image_tag_service1}"
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = "/ecs/${var.task_definition_service1}"
            awslogs-region        = var.aws_deploy_region
            awslogs-stream-prefix = "ecs"
          }
        }
        mountPoints = []
        name        = var.container_image_service1
        portMappings = [
          {
            containerPort = var.port_service1
            hostPort      = var.port_service1
            protocol      = "tcp"
          },
        ]
        volumesFrom = []
      },
      {
        cpu = 0
        environment = [
          {
            name  = "APPMESH_VIRTUAL_NODE_NAME"
            value = "mesh/${var.app_mesh_name}/virtualNode/${var.service1}"
          },
        ]
        essential = true
        healthCheck = {
          command = [
            "CMD-SHELL",
            "curl -s http://localhost:9901/server_info | grep state | grep -q LIVE",
          ]
          interval    = 5
          retries     = 3
          startPeriod = 10
          timeout     = 2
        }
        image        = "${var.account_id}${var.envoy_image}"
        memory       = 500
        mountPoints  = []
        name         = "envoy"
        portMappings = []
        user         = "1337"
        volumesFrom  = []
      },
    ]
  )
  cpu                = "512"
  execution_role_arn = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  memory             = "1024"
  network_mode       = "awsvpc"
  requires_compatibilities = [
    "FARGATE",
  ]

  task_role_arn = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"

  proxy_configuration {
    container_name = "envoy"
    properties = {
      "AppPorts"           = var.port_service1
      "EgressIgnoredIPs"   = "169.254.170.2,169.254.169.254"
      "EgressIgnoredPorts" = ""
      "IgnoredGID"         = ""
      "IgnoredUID"         = "1337"
      "ProxyEgressPort"    = "15001"
      "ProxyIngressPort"   = "15000"
    }
    type = "APPMESH"
  }
}
