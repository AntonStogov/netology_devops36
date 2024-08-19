resource "local_file" "ansible_inventory" {
  content  = templatefile("${path.module}/templates/inventory.tpl", {
    webservers = [for k, v in yandex_compute_instance.web : v.network_interface.0.nat_ip_address],
    databases  = [for k, v in yandex_compute_instance.db : v.network_interface.0.nat_ip_address],
    storage    = yandex_compute_instance.storage.network_interface.0.nat_ip_address,
    web_fqdns  = [for k, v in yandex_compute_instance.web : v.fqdn],
    db_fqdns   = [for k, v in yandex_compute_instance.db : v.fqdn],
    storage_fqdn = yandex_compute_instance.storage.fqdn
  })
  filename = "${path.module}/inventory.ini"
}

