##Creción API Gateway
resource "aws_api_gateway_rest_api" "api_gateway" {
  name = var.api_gateway_name
}

##Creacion VPCLink
resource "aws_api_gateway_vpc_link" "nlb_vpc_link" {
  depends_on = [
    aws_lb.nlb
  ]
  name        = var.vpc_link_name
  description = "eaesof VPC Link"
  target_arns = [aws_lb.nlb.arn]
}
