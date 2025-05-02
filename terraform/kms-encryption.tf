resource "yandex_kms_symmetric_key" "k8s_key" {
  name              = "k8s-key"
  description       = "S3 encryption key"
  default_algorithm = "AES_256"
  rotation_period   = "8760h"
}