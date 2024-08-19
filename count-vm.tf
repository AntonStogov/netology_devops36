// count-vm.tf
data "yandex_compute_image" "ubuntu_web" {
  family = "ubuntu-2004-lts"
}

// Используйте `ubuntu_web` в этом файле
resource "yandex_compute_instance" "web" {
  count = 2

  name = "web-${count.index + 1}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_web.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true

    security_group_ids = [
      yandex_vpc_security_group.example.id
    ]
  }

  metadata = {
  ssh-keys = "ubuntu:${file("/home/sysad_ubuntu/.ssh/id_rsa.pub")}"
}
}
