

locals {
  firewallIps = var.allowed_ips
  droplet_ids = [digitalocean_droplet.nomadworker1.id, digitalocean_droplet.nomadworker2.id, digitalocean_droplet.nomadworker3.id]
}

resource "digitalocean_firewall" "only_home_allowed" {
  name = "only-home-access-allowed"

  droplet_ids = local.droplet_ids

  inbound_rule {
    protocol           = "tcp"
    port_range         = "22"
    source_addresses   = var.allowed_ips
    source_droplet_ids = local.droplet_ids
  }

  inbound_rule {
    protocol           = "tcp"
    port_range         = "all"
    source_addresses   = local.firewallIps
    source_droplet_ids = local.droplet_ids
  }

  inbound_rule {
    protocol           = "udp"
    port_range         = "all"
    source_addresses   = local.firewallIps
    source_droplet_ids = local.droplet_ids
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
