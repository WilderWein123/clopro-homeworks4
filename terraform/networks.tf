resource "yandex_vpc_network" "mysql" {}

resource "yandex_vpc_subnet" "mysql-a" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.mysql.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

resource "yandex_vpc_subnet" "mysql-d" {
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.mysql.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_network" "kubernetes" {}

resource "yandex_vpc_subnet" "kubernetes-a" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.kubernetes.id
  v4_cidr_blocks = ["172.16.0.0/24"]
}

resource "yandex_vpc_subnet" "kubernetes-b" {
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.kubernetes.id
  v4_cidr_blocks = ["172.16.1.0/24"]
}

resource "yandex_vpc_subnet" "kubernetes-d" {
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.kubernetes.id
  v4_cidr_blocks = ["172.16.2.0/24"]
}
