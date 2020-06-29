provider "digitalocean" {
  token = var.do_token
}
variable "do_token" {}

variable "ssh_md5" {}
variable "ssh_private_key_file" {}

variable "allowed_ips" {
  type    = list(string)
}

variable "image_id" {}

resource "digitalocean_droplet" "nomadworker1" {
  image      = var.image_id
  name       = "nomadworker1"
  region     = "ams3"
  size       = "s-1vcpu-1gb"
  monitoring = true
  private_networking = true
  vpc_uuid = "2d22a5e9-aded-4790-bba6-62af42779165"
  ssh_keys = [
    var.ssh_md5
  ]
  tags = ["nomad"]
}

resource "digitalocean_droplet" "nomadworker2" {
  image      = var.image_id
  name       = "nomadworker2"
  region     = "ams3"
  size       = "s-1vcpu-1gb"
  monitoring = true
  private_networking = true
  vpc_uuid = "2d22a5e9-aded-4790-bba6-62af42779165"
  ssh_keys = [
    var.ssh_md5
  ]
  tags = ["nomad"]
}

resource "digitalocean_droplet" "nomadworker3" {
  image      = var.image_id
  name       = "nomadworker3"
  region     = "ams3"
  size       = "s-1vcpu-1gb"
  monitoring = true
  private_networking = true
  vpc_uuid = "2d22a5e9-aded-4790-bba6-62af42779165"
  ssh_keys = [
    var.ssh_md5
  ]
  tags = ["nomad"]
}
