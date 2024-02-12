resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_network" "develop_db" {
  name = var.vm_db_vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop_db.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform_vm_web" {
  name        = local.platform_vm_web_name
  platform_id = var.vm_web_resource_platform_id
  resources {
    cores = var.resources_vm_web["cpu"]
    memory = var.resources_vm_web["ram"]
    core_fraction = var.resources_vm_web["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_scheduling_polyci_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_network_interface_nat
  }

  metadata = {
    serial-port-enable = var.metadata ["metadata_serial-port"]
    ssh-keys           = "ubuntu:${var.metadata ["vms_ssh_root_key"]}"
  }
}

resource "yandex_compute_instance" "platform_vm_db" {
  name        = local.platform_vm_db_name
  platform_id = var.vm_db_resource_platform_id
  zone        = var.vm_db_zone
  resources {
    cores = var.resources_vm_db["cpu"]
    memory = var.resources_vm_db["ram"]
    core_fraction = var.resources_vm_db["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_scheduling_polyci_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db_network_interface_nat
  }

  metadata = {
    serial-port-enable = var.metadata ["metadata_serial-port"]
    ssh-keys           = "ubuntu:${var.metadata ["vms_ssh_root_key"]}"
  }
}
