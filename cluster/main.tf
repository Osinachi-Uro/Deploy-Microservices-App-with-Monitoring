variable "do_token" {}

terraform {
  required_providers {
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


provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "sockshop" {
  name    = "sockshop"
  region  = "lon1"
  version = "1.25.12-do.0"
  ha = true

  node_pool {
    name       = "node"
    size       = "s-4vcpu-8gb"
   #size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 3
    max_nodes  = 5
  }
}
