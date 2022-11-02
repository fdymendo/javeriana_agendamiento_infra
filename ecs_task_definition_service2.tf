resource "aws_ecs_task_definition" "task_definition_service2" {
  depends_on = [
    aws_service_discovery_private_dns_namespace.cloudmap
  ]
  family = var.task_definition_service2
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
        environment = [
          {
          name = "MYSQL_IP",
          value = "carroya-eaesof.cw8wuioquzwa.us-east-1.rds.amazonaws.com"
        },
        {
          name = "MYSQL_PORT",
          value = "3306"
        },
        {
          name = "MYSQL_USER",
          value = "carroya"
        },
        {
          name = "MYSQL_PWD",
          value = "CarroyaRecargado"
        }
        ]
        essential   = true
        image       = "${var.account_id}${var.account_arn_ecr}/${var.ecr_repo_service2}:${var.ecr_image_tag_service2}"
        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-group         = "/ecs/${var.task_definition_service2}"
            awslogs-region        = var.aws_deploy_region
            awslogs-stream-prefix = "ecs"
          }
        }
        mountPoints = []
        name        = var.container_image_service2
        portMappings = [
          {
            containerPort = var.port_service2
            hostPort      = var.port_service2
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
            value = "mesh/${var.app_mesh_name}/virtualNode/${var.service2}"
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
        image        = "${var.envoy_image}"
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
  execution_role_arn = "${var.ecs_role_arn}"
  memory             = "1024"
  network_mode       = "awsvpc"
  requires_compatibilities = [
    "FARGATE",
  ]

  task_role_arn = "${var.ecs_role_arn}"

  proxy_configuration {
    container_name = "envoy"
    properties = {
      "AppPorts"           = var.port_service2
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
