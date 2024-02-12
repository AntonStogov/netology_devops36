###local variables
variable "env" {
  type        = string
  default     = "netology"
  description = "lesson 2_5"
}

variable "project" {
  type        = string
  default     = "develop"
  description = "lesson 2_5"
}

variable "role" {
  type        = string
  default     = "platform-web"
  description = "lesson 2_5"
}

###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/25"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM940nCLRJvNo029Ra/8dq+ti4S5QLCdOyItAqy7PyEk sysad@sysad-home"
#  description = "ssh-keygen -t ed25519"
#}


###vm_web vars

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Ubuntu 20.04 LTS"
}

###lesson 2_6
#пример из terraform.tfvars:
variable "resources_vm_web" {
  type    = map
  default = {
    cpu           = 2
    ram           = 4
    core_fraction = 5
  }
}

variable "metadata" {
  type    = map
  default = {
    vms_ssh_root_key       = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM940nCLRJvNo029Ra/8dq+ti4S5QLCdOyItAqy7PyEk sysad@sysad-home"
    metadata_serial-port   = 1
  }
}
###


#variable "vm_web_resource_name" {
#  type        = string
#  default     = "netology-develop-platform-web"
#  description = "Name"
#}

#variable "vm_web_resource_cores" {
#  type        = number
#  default     = 2
#  description = "Core"
#}

#variable "vm_web_resource_memory" {
#  type        = number
#  default     = 4
#  description = "Memory"
#}

#variable "vm_web_resource_cores_fraction" {
#  type        = number
#  default     = 5
#  description = "Core_fraction"
#}

variable "vm_web_resource_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform"
}

variable "vm_web_scheduling_polyci_preemptible" {
  type        = bool
  default     = true
  description = "Polyci_preemptible"
}

variable "vm_web_network_interface_nat" {
  type        = bool
  default     = true
  description = "Interface_nat"
}

#variable "vm_web_metadata_serial-port-enable" {
#  type        = number
#  default     = 1
#  description = "Serial_port_enable"
#}