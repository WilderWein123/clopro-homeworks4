
variable "cloud_id" {
  type        = string
  default     = "dn233vdl3pdu43936vpg"
}

variable "folder_id" {
  type        = string
  default     = "b1gj6ia0559mol9ufg9k"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "token" {
  type        = string
}

resource "yandex_vpc_network" "public-a" {}

resource "yandex_vpc_subnet" "public-a" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.public-a.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

resource "yandex_vpc_network" "public-d" {}

resource "yandex_vpc_subnet" "public-d" {
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.public-d.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}