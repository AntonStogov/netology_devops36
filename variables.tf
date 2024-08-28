variable "token" {
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
  type        = string
}

variable "cloud_id" {
  description = "Cloud ID; https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  type        = string
}

variable "folder_id" {
  description = "Folder ID; https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  type        = string
}

variable "default_zone" {
  description = "Default zone; https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type        = string
  default     = "ru-central1-a"
}

variable "default_cidr" {
  description = "CIDR for the subnet; https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vpc_name" {
  description = "VPC network name"
  type        = string
  default     = "develop"
}

variable "instance_count" {
  description = "Number of web instances"
  type        = number
  default     = 2
}

variable "web_instance_type" {
  description = "Web instance type settings"
  type = object({
    cores  = number
    memory = number
  })
  default = {
    cores  = 2
    memory = 2
  }
}

variable "each_vm" {
  description = "Database instances configurations"
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))
  default = [
    { vm_name = "main", cpu = 4, ram = 8, disk_volume = 100 },
    { vm_name = "replica", cpu = 2, ram = 4, disk_volume = 50 }
  ]
}

variable "ssh_user" {
  description = "SSH user for accessing instances"
  type        = string
  default     = "sysad_ubuntu"
}

variable "storage_disk_count" {
  description = "Number of storage disks"
  type        = number
  default     = 3
}

variable "storage_disk_size" {
  description = "Size of each storage disk"
  type        = number
  default     = 10  # Size in GB
}

variable "storage_disk_type" {
  description = "Type of storage disk"
  type        = string
  default     = "network-hdd"
}

variable "storage_instance_name" {
  description = "Name of the storage instance"
  type        = string
  default     = "storage"
}

variable "storage_instance_resources" {
  description = "Resources (CPU and RAM) for storage instance"
  type = object({
    cores  = number
    memory = number
  })
  default = {
    cores  = 2
    memory = 2
  }
}

variable "security_group_ingress" {
  description = "Ingress rules for security group"
  type = list(object({
    protocol       = string
    description    = string
    v4_cidr_blocks = list(string)
    port           = optional(number)
    from_port      = optional(number)
    to_port        = optional(number)
  }))
  default = [
    {
      protocol       = "TCP"
      description    = "Allow SSH"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 22
    },
    {
      protocol       = "TCP"
      description    = "Allow HTTP"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 80
    },
    {
      protocol       = "TCP"
      description    = "Allow HTTPS"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 443
    },
  ]
}

variable "security_group_egress" {
  description = "Egress rules for security group"
  type = list(object({
    protocol       = string
    description    = string
    v4_cidr_blocks = list(string)
    port           = optional(number)
    from_port      = optional(number)
    to_port        = optional(number)
  }))
  default = [
    { 
      protocol       = "TCP"
      description    = "Allow all outgoing traffic"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 0
      to_port        = 65365
    }
  ]
}