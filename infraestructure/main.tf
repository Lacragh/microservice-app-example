provider "aws" {
  region = "us-east-1"
}

# Crear una VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Crear subnets
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

# Crear un grupo de seguridad
resource "aws_security_group" "allow_http_https" {
  name        = "allow_http_https"
  description = "Permitir HTTP y HTTPS"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Crear un clúster de Kubernetes (EKS)
resource "aws_eks_cluster" "example" {
  name     = "microservices-cluster"
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = [aws_subnet.public.id]
  }
}