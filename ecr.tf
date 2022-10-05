resource "aws_ecr_repository" "service1" {
  name                 = var.ecr_repo_service1
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "service2" {
  name                 = var.ecr_repo_service2
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "service3" {
  name                 = var.ecr_repo_service3
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}