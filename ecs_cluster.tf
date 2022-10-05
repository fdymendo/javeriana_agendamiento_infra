resource "aws_ecs_cluster" "ecs_cluster" {
  depends_on = [
    aws_appmesh_mesh.app_mesh
  ]
  name = var.ecs_cluster

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
