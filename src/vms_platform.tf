###local variables
variable "db_env" {
  type        = string
  default     = "netology"
  description = "lesson 2_5"
}

variable "db_project" {
  type        = string
  default     = "develop"
  description = "lesson 2_5"
}

variable "db_role" {
  type        = string
  default     = "platform-db"
  description = "lesson 2_5"
}

###cloud vars
variable "vm_db_token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "vm_db_cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "vm_db_folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

#variable "vm_db_default_zone" {
#  type        = string
#  default     = "ru-central1-b"
#  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
#}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.128/25"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop_db"
  description = "VPC network & subnet name"
}


###ssh vars

#variable "vm_db_vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM940nCLRJvNo029Ra/8dq+ti4S5QLCdOyItAqy7PyEk sysad@sysad-home"
#  description = "ssh-keygen -t ed25519"
#}



###lesson 2_6
#пример из terraform.tfvars:
variable "resources_vm_db" {
  type=map
  default= {
    cpu =2
    ram = 2
    core_fraction = 20
  }
}
###

###vm_web vars

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

#variable "vm_db_resource_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#}

#variable "vm_db_resource_cores" {
#  type        = number
#  default     = 2
#}

variable "vm_db_zone" {
    type      = string
    default   = "ru-central1-b"
}

#variable "vm_db_resource_memory" {
#  type        = number
#  default     = 2
#}

#variable "vm_db_resource_cores_fraction" {
#  type        = number
#  default     = 20
#}

variable "vm_db_resource_platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "vm_db_scheduling_polyci_preemptible" {
  type        = bool
  default     = true
}

variable "vm_db_network_interface_nat" {
  type        = bool
  default     = true
}

#variable "vm_db_metadata_serial-port-enable" {
#  type        = number
#  default     = 1
#}