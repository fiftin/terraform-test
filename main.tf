terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "denguk" {
  name = "denguk"
}

resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-23-10-x64"
  name = "www-1"
  region = "ams3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.denguk.id
  ]
}