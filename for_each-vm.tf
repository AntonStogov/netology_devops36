// for_each-vm.tf
data "yandex_compute_image" "ubuntu_db" {
  family = "ubuntu-2004-lts"
}

// Используйте `ubuntu_db` в этом файле
resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name = each.value.vm_name

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      size     = each.value.disk_volume
      image_id = data.yandex_compute_image.ubuntu_db.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file("/home/sysad_ubuntu/.ssh/id_rsa.pub")}"
}
}
