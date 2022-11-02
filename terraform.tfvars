##General
aws_deploy_region = "us-east-1"
account_id = "006078069859"
account_arn_ecr = ".dkr.ecr.us-east-1.amazonaws.com"
ecs_role_arn = "arn:aws:iam::006078069859:role/ecsTaskExecutionRole"

##VPC
vpc_name = "eaesof"

##Security
nlb_to_alb_sg_name = "eaesof_nlb_to_alb"
alb_to_ecs_sg_name = "eaesof_alb_to_ecs"

##For Cloudmap
cloudmap_name = "eaesof.prod.local"
cloudmap_description = "Proyecto eaesof"

##App mesh
app_mesh_name = "eaesof"
envoy_image = "840364872350.dkr.ecr.us-east-1.amazonaws.com/aws-appmesh-envoy:v1.23.1.0-prod"

##For ECS
ecs_cluster = "eaesof"

##API Gateway
vpc_link_name = "vpclink-eaesof"
api_gateway_name = "apigateway-eaesoft"

##EC2 Network
nlb_name = "nlb-eaesof"
alb_name = "alb-eaesof"
target_group_alb = "tg-eaesof-alb"

##S3
bucket_name = "agendamientofrontend-eaesof-865373903242"

#Service1
service1 = "usuarios"
port_service1 = "8080"
task_definition_service1  = "task-eaesof-usuarios"
container_image_service1 = "cont-eaesof-usuarios"
healt_check_service1 = "/usuarios/"
ecr_repo_service1 = "usuarios-eaesof"
ecr_image_tag_service1 = "usuarios"
target_group_service1 = "tg-eaesof-usuarios"

# Service2
service2 = "infracciones"
port_service2 = "8081"
task_definition_service2 = "task-eaesof-infracciones"
container_image_service2 = "cont-eaesof-infracciones"
healt_check_service2 = "/infraccion/"
ecr_repo_service2 = "infracciones-eaesof"
ecr_image_tag_service2 = "infracciones"
target_group_service2 = "tg-eaesof-infracciones"

#Service 3
service3 = "agendamiento"
port_service3 = "8082"
task_definition_service3 = "task-eaesof-agendamiento"
container_image_service3 = "cont-eaesof-agendamiento"
healt_check_service3  = "/agendamiento/"
ecr_repo_service3 = "agendamiento-eaesof"
ecr_image_tag_service3 = "agendamiento"
target_group_service3 = "tg-eaesof-agendamiento"