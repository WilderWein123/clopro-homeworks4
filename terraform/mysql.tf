resource "yandex_mdb_mysql_cluster" "cluster01" {
  name        = var.mysql.mycluster.name
  environment = var.mysql.mycluster.environment
  network_id  = yandex_vpc_network.mysql.id
  version     = var.mysql.mycluster.version
  deletion_protection = var.mysql.mycluster.deletion
  backup_retain_period_days = var.mysql.mycluster.backup-keep
  backup_window_start {
    hours = var.mysql.mycluster.backup-start-hours
    minutes = var.mysql.mycluster.backup-start-minutes
  }

  resources {
    resource_preset_id = var.mysql.mycluster.resources-preset
    disk_type_id       = var.mysql.mycluster.resources-disk-type
    disk_size          = var.mysql.mycluster.resources-disk-size
  }

  mysql_config = {
    sql_mode                      = var.mysql.mycluster.config-sql-mode
    max_connections               = var.mysql.mycluster.config-max-connections
    default_authentication_plugin = var.mysql.mycluster.config-default-auth-plugin
    innodb_print_all_deadlocks    = var.mysql.mycluster.config-innodb-deadlocks
  }

  host {
    name = var.mysql-nodes.node01.name
    zone      = var.mysql-nodes.node01.zone
    subnet_id = yandex_vpc_subnet.mysql-a.id
    backup_priority = var.mysql-nodes.node01.backup_priority
  }

  host {
    name = var.mysql-nodes.node02.name
    zone      = var.mysql-nodes.node02.zone
    subnet_id = yandex_vpc_subnet.mysql-d.id
    replication_source_name = var.mysql-nodes.node01.name
    backup_priority = var.mysql-nodes.node02.backup_priority
  }

  maintenance_window {
    type = var.mysql.mycluster.maintenance-type
  }
}

resource "yandex_mdb_mysql_database" "my_db" {
  cluster_id = yandex_mdb_mysql_cluster.cluster01.id
  name = var.mysql.mycluster.dbname
}

resource "yandex_mdb_mysql_user" "my_user" {
  cluster_id = yandex_mdb_mysql_cluster.cluster01.id
  name       = var.mysql-users.user1.name
  password   = var.mysql-users.user1.password

  permission {
    database_name = yandex_mdb_mysql_database.my_db.name
    roles         = var.mysql-users.user1.permission-roles
  }
 authentication_plugin = var.mysql-users.user1.authentication
}