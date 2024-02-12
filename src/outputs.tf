# Объявите в файле outputs.tf один output , 
# содержащий: instance_name, external_ip, 
# fqdn для каждой из ВМ в удобном лично для вас формате.

output "vm_info" {
  value = {
    platform_vm_web = {
      instance_name = yandex_compute_instance.platform_vm_web.name,
      external_ip = yandex_compute_instance.platform_vm_web.network_interface[0].nat_ip_address,
      fqdn = yandex_compute_instance.platform_vm_web.fqdn
    },
    platform_vm_db = {
      instance_name = yandex_compute_instance.platform_vm_db.name,
      external_ip = yandex_compute_instance.platform_vm_db.network_interface[0].nat_ip_address,
      fqdn = yandex_compute_instance.platform_vm_db.fqdn
      }
    }
  }
