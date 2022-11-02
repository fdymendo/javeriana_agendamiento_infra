##General
variable "account_id" {
  type = string
}

variable "account_arn_ecr" {
  type    = string
}

variable "ecs_role_arn" {
  type = string
}

variable "aws_deploy_region" {
  type    = string
}

##VPC
variable "vpc_name" {
  type    = string
}

##Security
variable "nlb_to_alb_sg_name" {
  type    = string
}

variable "alb_to_ecs_sg_name" {
  type    = string
}

##For Cloudmap
variable "cloudmap_name" {
  type    = string
}

variable "cloudmap_description" {
  type    = string
}

##App mesh
variable "app_mesh_name" {
  type    = string
}

variable "envoy_image" {
  type    = string
}

##For ECS
variable "ecs_cluster" {
  type    = string
}

##API Gateway
variable "vpc_link_name" {
  type    = string
}

variable "api_gateway_name" {
  type    = string
}

##EC2 Network
variable "nlb_name" {
  type    = string
}

variable "alb_name" {
  type    = string
}

variable "target_group_alb" {
  description = "Target group con direcciones IP del balanceador de aplicación"
  type        = string
}

##S3
variable "bucket_name" {
  type = string  
}

#Service1
variable "service1" {
  description = "Servicio numero 1 a crear: usuarios"
  type        = string
}

variable "port_service1" {
  description = "Port to service1"
  type        = number
}

variable "task_definition_service1" {
  description = "Task definition para el service1"
  type        = string
}

variable "container_image_service1" {
  description = "Imagen contenedor service1"
  type        = string
}

variable "healt_check_service1" {
  description = "Healt check para service1"
  type        = string
}

variable "ecr_repo_service1" {
  description = "Nombre para el repositorio en ECR para almacenar las imagenes del servicio 1"
  type        = string
}

variable "ecr_image_tag_service1" {
  description = "Tag imagen docker"
  type = string
}

variable "target_group_service1" {
  type    = string
}

# Service2
variable "service2" {
  description = "Servicio numero 2"
  type        = string
}

variable "port_service2" {
  description = "Port to service2"
  type        = number
}

variable "task_definition_service2" {
  description = "Task definition service2"
  type        = string
}

variable "container_image_service2" {
  description = "Imagen contenedor service2"
  type        = string
}

variable "healt_check_service2" {
  description = "Healt check para service2"
  type        = string
}

variable "ecr_repo_service2" {
  description = "Nombre para el repositorio en ECR para almacenar las imagenes del servicio 2"
  type        = string
}

variable "ecr_image_tag_service2" {
  description = "Tag imagen docker"
  type = string
}

variable "target_group_service2" {
  type    = string
}

#Service 3
variable "service3" {
  description = "Servicio numero 3"
  type        = string
}

variable "port_service3" {
  description = "Port to service3"
  type        = number
}

variable "task_definition_service3" {
  description = "Task definition para el service3"
  type        = string
}

variable "container_image_service3" {
  description = "Imagen contenedor service3"
  type        = string
}

variable "healt_check_service3" {
  description = "Healt check para service3"
  type        = string
}

variable "ecr_repo_service3" {
  description = "Nombre para el repositorio en ECR para almacenar las imagenes del servicio 11"
  type        = string
}

variable "ecr_image_tag_service3" {
  description = "Tag imagen docker"
  type = string
}

variable "target_group_service3" {
  type    = string
}