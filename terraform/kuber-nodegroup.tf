resource "yandex_kubernetes_node_group" "main_nodes" {
  cluster_id = yandex_kubernetes_cluster.netology_k8s.id
  name       = "main-nodegroup"
  version    = "1.29"

  scale_policy {
    auto_scale {
      min     = 3
      max     = 6
      initial = 3
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-a"
    }
  }

  instance_template {
    platform_id = "standard-v2"
    network_interface {
      subnet_ids = [
        yandex_vpc_subnet.kubernetes-1.id,
        yandex_vpc_subnet.kubernetes-2.id,
        yandex_vpc_subnet.kubernetes-3.id
      ]
      nat = true
    }

    resources {
      cores  = 2
      memory = 4
    }

    boot_disk {
      type = "network-ssd"
      size = 30
    }
  }
}