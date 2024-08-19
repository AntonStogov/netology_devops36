resource "yandex_compute_disk" "storage_disks" {
  count = 3

  name  = "storage-disk-${count.index + 1}"
  size  = 1
  type  = "network-hdd"  # Тип диска, можно изменить при необходимости
}

resource "yandex_compute_instance" "storage" {
  name = "storage"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_storage.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disks

    content {
      disk_id = secondary_disk.value.id
    }
  }

  metadata = {
  ssh-keys = "ubuntu:${file("/home/sysad_ubuntu/.ssh/id_rsa.pub")}"
}
}

data "yandex_compute_image" "ubuntu_storage" {
  family = "ubuntu-2004-lts"
}
