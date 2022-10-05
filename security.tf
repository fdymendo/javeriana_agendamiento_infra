##Traffic from NLB to ALB
resource "aws_security_group" "nlb_to_alb_sg" {
  name        = var.nlb_to_alb_sg_name
  description = "Allow traffic from NLB to ALB"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "allow_nlb_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = module.vpc.private_subnets_cidr_blocks
  security_group_id = aws_security_group.nlb_to_alb_sg.id
}

#Traffic from ALB to ECS Container Tasks
resource "aws_security_group" "alb_to_ecs_tasks_sg" {
  name        = var.alb_to_ecs_sg_name
  description = "Allow traffic from NLB to ALB"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "alb_to_ecs_ingress_rule" {
  description       = "Allow traffic from my own internal networks"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = module.vpc.private_subnets_cidr_blocks
  security_group_id = aws_security_group.alb_to_ecs_tasks_sg.id
}

resource "aws_security_group_rule" "allow_all" {
  description       = "Allow traffic to external networks"
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  security_group_id = aws_security_group.alb_to_ecs_tasks_sg.id
}
