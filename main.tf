terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
  required_version = "~>1.12.0"
}

provider "docker" {
  host = "ssh://admin@158.160.93.152"

  # Явное указание пути к SSH
  ssh_opts = [
    "-o", "StrictHostKeyChecking=no",
    "-o", "UserKnownHostsFile=/dev/null"
  ]
}

resource "random_password" "MYSQL_ROOT_PASSWORD" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "MYSQL_PASSWORD" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = true
}

resource "docker_container" "db_mysql" {
  image = docker_image.mysql.image_id
  name  = "db_mysql"

  ports {
    ip = "127.0.0.1"
    internal = 3306
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.MYSQL_ROOT_PASSWORD.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.MYSQL_PASSWORD.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}
