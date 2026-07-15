terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.54"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }
  }
}