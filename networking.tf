##Network Load balancer - Creación
resource "aws_lb" "nlb" {
  internal                         = true
  ip_address_type                  = "ipv4"
  load_balancer_type               = "network"
  name                             = var.nlb_name
  security_groups                  = []
  subnets                          = module.vpc.private_subnets
  enable_cross_zone_load_balancing = true
}

##Creación listener
resource "aws_lb_listener" "nlb_listener" {
  depends_on        = [aws_lb_target_group.target_group_alb]
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_alb.arn
  }
}

##Application load balancer
resource "aws_lb" "alb" {

  depends_on = [
    aws_security_group.nlb_to_alb_sg
  ]
  name               = var.alb_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nlb_to_alb_sg.id]
  subnets            = module.vpc.private_subnets
}

##Application load balancer listener
resource "aws_lb_listener" "alb_listener" {
  depends_on = [
    aws_lb.alb
  ]
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Resource not found"
      status_code  = "400"
    }
  }
}

##ALB Listener rules
resource "aws_lb_listener_rule" "alb_listener_service1" {
  depends_on = [
    aws_lb_listener.alb_listener
  ]
  listener_arn = aws_lb_listener.alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_service1.arn
  }

  condition {
    path_pattern {
      values = [var.healt_check_service1, "${var.healt_check_service1}*"]
    }
  }
}

resource "aws_lb_listener_rule" "alb_listener_service2" {
  depends_on = [
    aws_lb_listener.alb_listener
  ]
  listener_arn = aws_lb_listener.alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_service2.arn
  }

  condition {
    path_pattern {
      values = [var.healt_check_service2, "${var.healt_check_service2}*"]
    }
  }
}

resource "aws_lb_listener_rule" "alb_listener_service3" {
  depends_on = [
    aws_lb_listener.alb_listener
  ]
  listener_arn = aws_lb_listener.alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_service3.arn
  }

  condition {
    path_pattern {
      values = [var.healt_check_service3, "${var.healt_check_service3}*"]
    }
  }
}