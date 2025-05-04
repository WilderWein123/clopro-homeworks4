variable mysql {
  type = map(object({
    name = string
    environment = string
    version = string
    deletion = bool
    resources-preset = string
    resources-disk-type = string
    resources-disk-size = number
    config-sql-mode = string
    config-max-connections = number
    config-default-auth-plugin = string
    config-innodb-deadlocks = bool
    maintenance-type = string
    username = string
    password = string
    dbname = string
    backup-keep = number
    backup-start-hours = number
    backup-start-minutes = number
  }))
  default = {
    "mycluster" = {
      name = "cluster01"
      environment = "PRESTABLE"
      version = "8.0"
      deletion = true
      resources-preset = "b1.medium"
      resources-disk-type = "network-hdd"
      resources-disk-size = 20
      config-sql-mode = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
      config-max-connections = 512
      config-default-auth-plugin = "MYSQL_NATIVE_PASSWORD"
      config-innodb-deadlocks = true
      maintenance-type = "ANYTIME"
      username = "dbuser"
      password = "My$ecuredPa$$wrd01"
      dbname = "netology_db"
      backup-keep = 7
      backup-start-hours = 23
      backup-start-minutes = 59
    }
  }
}

variable mysql-nodes {
  type = map(object({
    name = string
    zone = string
    backup_priority = number
  }))
  default = {
    "node01" = {
      name = "node01"
      zone = "ru-central1-a"
      backup_priority = 10
    }
    "node02" = {
      name = "node02"
      zone = "ru-central1-b"
      backup_priority = 20
    }
  }
}

variable mysql-users {
  type = map(object({
    name = string
    password = string
    permission-roles = list(string)
    authentication = string
  }))
  default = {
    "user1" = {
      name = "user1"
      password = "My$ecuredPassword!23"
      permission-roles = ["ALL"]
      authentication = "SHA256_PASSWORD"
    }
  }
}

