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