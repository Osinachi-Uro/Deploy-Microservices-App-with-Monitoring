provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}

provider "digitalocean" {
  token = "${var.do_token}"
}

variable "do_token" {}

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.9.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }

    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~>2.0"
    }

  }
  
#  backend "s3" {
#    bucket         = "sockshop-state"
#    key            = "cluster/terraform.tfstate"
#    region         = "us-east-2"
#    dynamodb_table = "sockshop-locks"
#  }
 }
