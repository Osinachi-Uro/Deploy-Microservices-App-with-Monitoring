terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}


provider "kubernetes" {
  config_path = pathexpand("~/.kube/config")
}


resource "kubernetes_namespace" "kube-namespace" {
  metadata {
    name = "app-sockshop"
  }
}
