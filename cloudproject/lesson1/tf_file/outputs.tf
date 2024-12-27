output "nat_instance_info" {
  value = {
    name        = yandex_compute_instance.nat.name
    ip_external = yandex_compute_instance.nat.network_interface[0].nat_ip_address
    ip_internal = yandex_compute_instance.nat.network_interface[0].ip_address
    network = yandex_vpc_network.dvl.name
    subnet = yandex_vpc_subnet.public.name
  }
}

output "public_vm_info" {
  value = {
    name        = yandex_compute_instance.public.name
    ip_external = yandex_compute_instance.public.network_interface[0].nat_ip_address
    ip_internal = yandex_compute_instance.public.network_interface[0].ip_address
    network = yandex_vpc_network.dvl.name
    subnet = yandex_vpc_subnet.public.name
  }
}

output "private_vm_info" {
  value = {
    name        = yandex_compute_instance.private.name
    ip_external = yandex_compute_instance.private.network_interface[0].nat_ip_address
    ip_internal = yandex_compute_instance.private.network_interface[0].ip_address
    network = yandex_vpc_network.dvl.name
    subnet = yandex_vpc_subnet.private.name
  }
}