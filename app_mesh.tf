resource "aws_appmesh_mesh" "app_mesh" {
  depends_on = [
    aws_service_discovery_private_dns_namespace.cloudmap
  ]
  name = var.app_mesh_name

  spec {
    egress_filter {
      type = "ALLOW_ALL"
    }
  }
}

resource "aws_appmesh_virtual_node" "vn_service1" {
  name      = var.service1
  mesh_name = aws_appmesh_mesh.app_mesh.id

  spec {
    listener {
      port_mapping {
        port     = var.port_service1
        protocol = "http"
      }
    }

    service_discovery {
      aws_cloud_map {
        attributes = {
          stack = "blue"
        }

        service_name   = var.service1
        namespace_name = aws_service_discovery_private_dns_namespace.cloudmap.name
      }
    }
  }
}

resource "aws_appmesh_virtual_service" "vs_service1" {
  depends_on = [aws_appmesh_virtual_node.vn_service1]
  name       = var.service1
  mesh_name  = aws_appmesh_mesh.app_mesh.id

  spec {
    provider {
      virtual_node {
        virtual_node_name = var.service1
      }
    }
  }
}

resource "aws_appmesh_virtual_node" "vn_service2" {
  name      = var.service2
  mesh_name = aws_appmesh_mesh.app_mesh.id

  spec {
    listener {
      port_mapping {
        port     = var.port_service2
        protocol = "http"
      }
    }

    service_discovery {
      aws_cloud_map {
        attributes = {
          stack = "blue"
        }

        service_name   = var.service2
        namespace_name = aws_service_discovery_private_dns_namespace.cloudmap.name
      }
    }
  }
}

resource "aws_appmesh_virtual_service" "vs_service2" {
  depends_on = [aws_appmesh_virtual_node.vn_service2]
  name       = var.service2
  mesh_name  = aws_appmesh_mesh.app_mesh.id

  spec {
    provider {
      virtual_node {
        virtual_node_name = var.service2
      }
    }
  }
}

resource "aws_appmesh_virtual_node" "vn_service3" {
  name      = var.service3
  mesh_name = aws_appmesh_mesh.app_mesh.id

  spec {
    listener {
      port_mapping {
        port     = var.port_service3
        protocol = "http"
      }
    }

    service_discovery {
      aws_cloud_map {
        attributes = {
          stack = "blue"
        }

        service_name   = var.service3
        namespace_name = aws_service_discovery_private_dns_namespace.cloudmap.name
      }
    }
  }
}

resource "aws_appmesh_virtual_service" "vs_service3" {
  depends_on = [aws_appmesh_virtual_node.vn_service3]
  name       = var.service3
  mesh_name  = aws_appmesh_mesh.app_mesh.id

  spec {
    provider {
      virtual_node {
        virtual_node_name = var.service3
      }
    }
  }
}