resource "digitalocean_droplet" "nomadworker1" {
  image      = var.image_id
  name       = "nomadworker1"
  region     = "ams3"
  size       = "s-1vcpu-1gb"
  monitoring = true
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
  ssh_keys = [
    var.ssh_md5
  ]
  tags = ["nomad"]
}
