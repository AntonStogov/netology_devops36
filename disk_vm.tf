resource "yandex_compute_disk" "storage_disks" {
  count = var.storage_disk_count

  name  = "${var.storage_instance_name}-disk-${count.index + 1}"
  size  = var.storage_disk_size
  type  = var.storage_disk_type
}

resource "yandex_compute_instance" "storage" {
  name = var.storage_instance_name

  resources {
    cores  = var.storage_instance_resources.cores
    memory = var.storage_instance_resources.memory
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
    ssh-keys = "ubuntu:${file("/home/${var.ssh_user}/.ssh/id_rsa.pub")}"
  }
}

data "yandex_compute_image" "ubuntu_storage" {
  family = "ubuntu-2004-lts"
}