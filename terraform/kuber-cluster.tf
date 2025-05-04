resource "yandex_kubernetes_cluster" "netology_k8s" {
  name        = vars.kubernetes.mycluster.name
  network_id  = yandex_vpc_network.kubernetes.id
  cluster_ipv4_range = vars.kubernetes.mycluster.clusternet
  service_ipv4_range = vars.kubernetes.mycluster.servicenet

  master {
    regional {
      region = vars.kubernetes.mycluster.region
      location {
        zone      = vars.kubernetes.mycluster.region
        subnet_id = yandex_vpc_subnet.kubernetes.id
      }
      location {
        zone      = vars.kubernetes.mycluster.region
        subnet_id = yandex_vpc_subnet.kubernetes.id
      }
      location {
        zone      = vars.kubernetes.mycluster.region
        subnet_id = yandex_vpc_subnet.kubernetes.id
      }
    }
    version   = vars.kubernetes.mycluster.version
    public_ip = vars.kubernetes.mycluster.public_ip
  }

  service_account_id      = var.service-account-id
  node_service_account_id = var.service-account-id

  kms_provider {
    key_id = yandex_kms_symmetric_key.k8s_key.id
  }
}