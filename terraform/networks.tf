resource "yandex_vpc_network" "mysql" {}

resource "yandex_vpc_subnet" "mysql-a" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.mysql.id
  v4_cidr_blocks = ["10.4.99.0/24"]
}

resource "yandex_vpc_subnet" "mysql-b" {
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.mysql.id
  v4_cidr_blocks = ["10.4.98.0/24"]
}

resource "yandex_vpc_network" "kubernetes" {}

resource "yandex_vpc_subnet" "kubernetes" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.kubernetes.id
  v4_cidr_blocks = ["10.254.1.0/24"]
}
