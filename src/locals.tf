#В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
#Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
#Примените изменения.

locals {
  platform_vm_web_name = "${var.env}-${var.project}-${var.role}"
  platform_vm_db_name = "${var.db_env}-${var.db_project}-${var.db_role}"
}