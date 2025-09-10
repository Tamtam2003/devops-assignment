terraform {
  required_version = ">= 1.6.0"

  required_providers {     # ✅ זה בלוק
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.29"
    }
  }
}
