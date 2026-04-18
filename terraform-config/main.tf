resource "minikube_cluster" "docker" {
  driver       = "docker"
  cluster_name = "minikube-acc-docker"
  addons = [
    "default-storageclass",
    "storage-provisioner"
  ]
}

provider "kubernetes" {
  host = minikube_cluster.docker.host

  client_certificate     = minikube_cluster.docker.client_certificate
  client_key             = minikube_cluster.docker.client_key
  cluster_ca_certificate = minikube_cluster.docker.cluster_ca_certificate
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}