resource "aws_service_discovery_private_dns_namespace" "cloudmap" {
  name        = var.cloudmap_name
  description = var.cloudmap_description
  vpc         = module.vpc.vpc_id
}

resource "aws_service_discovery_service" "cm_service1" {
  name = var.service1

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.cloudmap.id

    dns_records {
      ttl  = 300
      type = "A"
    }

    routing_policy = "WEIGHTED"
  }
}

resource "aws_service_discovery_service" "cm_service2" {
  name = var.service2

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.cloudmap.id

    dns_records {
      ttl  = 300
      type = "A"
    }

    routing_policy = "WEIGHTED"
  }
}

resource "aws_service_discovery_service" "cm_service3" {
  name = var.service3

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.cloudmap.id

    dns_records {
      ttl  = 300
      type = "A"
    }

    routing_policy = "WEIGHTED"
  }
}