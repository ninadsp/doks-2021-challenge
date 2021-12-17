resource "digitalocean_project" "doks_project" {
  name        = "doks-2021-challenge-openfaas"
  description = "DOKS 2021 Challenge - OpenFaaS"
  purpose     = "Class project / Educational purposes"
  environment = "Development"

  resources = [
    digitalocean_kubernetes_cluster.doks_cluster.urn
  ]
}
