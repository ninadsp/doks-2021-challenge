resource "digitalocean_vpc" "doks_vpc" {
  name     = "doks-vpc"
  region   = var.region
  ip_range = "10.0.10.0/24"
}
