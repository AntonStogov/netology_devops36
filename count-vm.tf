data "yandex_compute_image" "ubuntu_web" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "web" {
  count = var.instance_count

  name = "${var.vpc_name}-web-${count.index + 1}"

  resources {
    cores  = var.web_instance_type.cores
    memory = var.web_instance_type.memory
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
    ssh-keys = "ubuntu:${file("/home/${var.ssh_user}/.ssh/id_rsa.pub")}"
  }
}
