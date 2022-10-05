##General
variable "account_id" {
  type = string
  default = "168711566855"
}

variable "account_arn_ecr" {
  type    = string
  default = ".dkr.ecr.us-east-1.amazonaws.com"
}

variable "aws_deploy_region" {
  type    = string
  default = "us-east-1"
}

##VPC
variable "vpc_name" {
  type    = string
  default = "eaesof"
}

##Security
variable "nlb_to_alb_sg_name" {
  type    = string
  default = "eaesof_nlb_to_alb"
}

variable "alb_to_ecs_sg_name" {
  type    = string
  default = "eaesof_alb_to_ecs"
}

##For Cloudmap
variable "cloudmap_name" {
  type    = string
  default = "eaesof.prod.local"
}

variable "cloudmap_description" {
  type    = string
  default = "Proyecto eaesof"
}

##App mesh
variable "app_mesh_name" {
  type    = string
  default = "eaesof"
}

variable "envoy_image" {
  type    = string
  default = ".dkr.ecr.us-east-1.amazonaws.com/aws-appmesh-envoy:v1.17.3.0"
}

##For ECS
variable "ecs_cluster" {
  type    = string
  default = "eaesof"
}

##API Gateway
variable "vpc_link_name" {
  type    = string
  default = "vpclink-eaesof"
}

variable "api_gateway_name" {
  type    = string
  default = "apigateway-eaesoft"
}

##EC2 Network
variable "nlb_name" {
  type    = string
  default = "nlb-eaesof"
}

variable "alb_name" {
  type    = string
  default = "alb-eaesof"
}

variable "target_group_alb" {
  description = "Target group con direcciones IP del balanceador de aplicación"
  type        = string
  default     = "tg-eaesof-alb"
}

#Service1
variable "service1" {
  description = "Servicio numero 1 a crear: usuarios"
  type        = string
  default     = "usuarios"
}

variable "port_service1" {
  description = "Port to service1"
  type        = number
  default     = "80"
}

variable "task_definition_service1" {
  description = "Task definition para el service1"
  type        = string
  default     = "task-eaesof-usuarios"
}

variable "container_image_service1" {
  description = "Imagen contenedor service1"
  type        = string
  default     = "cont-eaesof-usuarios"
}

variable "healt_check_service1" {
  description = "Healt check para service1"
  type        = string
  default     = "/usuarios/"
}

variable "ecr_repo_service1" {
  description = "Nombre para el repositorio en ECR para almacenar las imagenes del servicio 1"
  type        = string
  default     = "usuarios-eaesof"
}

variable "ecr_image_tag_service1" {
  description = "Tag imagen docker"
  type = string
  default = "usuarios"
}

variable "target_group_service1" {
  type    = string
  default = "tg-eaesof-usuarios"
}

# Service2
variable "service2" {
  description = "Servicio numero 2"
  type        = string
  default     = "licencias"
}

variable "port_service2" {
  description = "Port to service2"
  type        = number
  default     = "80"
}

variable "task_definition_service2" {
  description = "Task definition service2"
  type        = string
  default     = "task-eaesof-licencias"
}

variable "container_image_service2" {
  description = "Imagen contenedor service2"
  type        = string
  default     = "cont-eaesof-licencias"
}

variable "healt_check_service2" {
  description = "Healt check para service2"
  type        = string
  default     = "/licencias/"
}

variable "ecr_repo_service2" {
  description = "Nombre para el repositorio en ECR para almacenar las imagenes del servicio 2"
  type        = string
  default     = "licencias-eaesof"
}

variable "ecr_image_tag_service2" {
  description = "Tag imagen docker"
  type = string
  default = "licencias"
}

variable "target_group_service2" {
  type    = string
  default = "tg-eaesof-licencias"
}

#Service 3
variable "service3" {
  description = "Servicio numero 3"
  type        = string
  default     = "agendamiento"
}

variable "port_service3" {
  description = "Port to service3"
  type        = number
  default     = "80"
}

variable "task_definition_service3" {
  description = "Task definition para el service3"
  type        = string
  default     = "task-eaesof-agendamiento"
}

variable "container_image_service3" {
  description = "Imagen contenedor service3"
  type        = string
  default     = "cont-eaesof-agendamiento"
}

variable "healt_check_service3" {
  description = "Healt check para service3"
  type        = string
  default     = "/agendamiento/"
}

variable "ecr_repo_service3" {
  description = "Nombre para el repositorio en ECR para almacenar las imagenes del servicio 11"
  type        = string
  default     = "agendamiento-eaesof"
}

variable "ecr_image_tag_service3" {
  description = "Tag imagen docker"
  type = string
  default = "agendamiento"
}

variable "target_group_service3" {
  type    = string
  default = "tg-eaesof-agendamiento"
}