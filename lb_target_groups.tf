##TG for Application load balancer
resource "aws_lb_target_group" "target_group_alb" {
  name        = var.target_group_alb
  port        = 80
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_lb_target_group" "target_group_service1" {
  name                 = var.target_group_service1
  port                 = var.port_service1
  protocol             = "HTTP"
  target_type          = "ip"
  vpc_id               = module.vpc.vpc_id
  deregistration_delay = 5

  health_check {
    enabled             = "true"
    healthy_threshold   = 2
    interval            = 5
    matcher             = 200
    path                = var.healt_check_service1
    timeout             = 4
    unhealthy_threshold = 10
  }
}

resource "aws_lb_target_group" "target_group_service2" {
  name                 = var.target_group_service2
  port                 = var.port_service2
  protocol             = "HTTP"
  target_type          = "ip"
  vpc_id               = module.vpc.vpc_id
  deregistration_delay = 5

  health_check {
    enabled             = "true"
    healthy_threshold   = 2
    interval            = 5
    matcher             = 200
    path                = var.healt_check_service2
    timeout             = 4
    unhealthy_threshold = 10
  }
}

resource "aws_lb_target_group" "target_group_service3" {
  name                 = var.target_group_service3
  port                 = var.port_service3
  protocol             = "HTTP"
  target_type          = "ip"
  vpc_id               = module.vpc.vpc_id
  deregistration_delay = 5

  health_check {
    enabled             = "true"
    healthy_threshold   = 2
    interval            = 5
    matcher             = 200
    path                = var.healt_check_service3
    timeout             = 4
    unhealthy_threshold = 10
  }
}