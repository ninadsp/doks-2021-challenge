data "digitalocean_kubernetes_versions" "doks_version" {
  version_prefix = "1.21."
}

resource "digitalocean_kubernetes_cluster" "doks_cluster" {
  name    = "doks-cluster"
  region  = var.region
  version = data.digitalocean_kubernetes_versions.doks_version.latest_version

  vpc_uuid = digitalocean_vpc.doks_vpc.id

  node_pool {
    name       = "doks-node-pool"
    size       = "s-1vcpu-2gb"
    node_count = "1"
  }
}
