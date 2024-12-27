variable "yandex_compute_instance_private" {
  type        = list(object({
    vm_name = string
    cores = number
    memory = number
    core_fraction = number
    hostname = string
    platform_id = string
  }))

  default = [{
      vm_name = "private"
      cores         = 2
      memory        = 2
      core_fraction = 5
      hostname = "private"
      platform_id = "standard-v1"
    }]
}

variable "boot_disk_private" {
  type        = list(object({
    size = number
    type = string
    image_id = string
    }))
    default = [ {
    size = 10
    type = "network-hdd"
    image_id = "fd8pbf0hl06ks8s3scqk"
  }]
}

resource "yandex_compute_instance" "private" {
  name        = var.yandex_compute_instance_private[0].vm_name
  platform_id = var.yandex_compute_instance_private[0].platform_id
  hostname = var.yandex_compute_instance_private[0].hostname

  resources {
    cores         = var.yandex_compute_instance_private[0].cores
    memory        = var.yandex_compute_instance_private[0].memory
    core_fraction = var.yandex_compute_instance_private[0].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.boot_disk_private[0].image_id
      type     = var.boot_disk_private[0].type
      size     = var.boot_disk_private[0].size
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh-keys}"
    serial-port-enable = "1"
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.private.id
    nat        = false
  }
  scheduling_policy {
    preemptible = true
  }
}