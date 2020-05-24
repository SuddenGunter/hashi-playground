locals {
  firewallIps = concat(var.allowed_ips, [digitalocean_droplet.nomadworker1.ipv4_address,digitalocean_droplet.nomadworker2.ipv4_address,digitalocean_droplet.nomadworker3.ipv4_address])
}

resource "digitalocean_firewall" "only_home_allowed" {
  name = "only-home-access-allowed"

  droplet_ids = [digitalocean_droplet.nomadworker1.id, digitalocean_droplet.nomadworker2.id, digitalocean_droplet.nomadworker3.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.allowed_ips
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "all"
    source_addresses = local.firewallIps
  }

  inbound_rule {
    protocol         = "udp"
    port_range       = "all"
    source_addresses = local.firewallIps
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
