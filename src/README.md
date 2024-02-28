# Задание №1 
1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider. 
    
    Ответ: изучил, список переменных которые мы будем позже использовать 
2. Создайте сервисный аккаунт и ключ. service_account_key_file. 

    Ответ: создал сервисный аккаунт 
    ___
    yc iam service-account create 
    
    --name=<sa_name> 
    
    --description=""
    ___
    yc resource-manager folder add-access-binding
    
    --name <folder_name>
    
    --role <role_name>
    
    --service-account-name <sa_name>
    ___
    yc iam key create
    
    --service-account-name <sa_name>
    
    --output key.json

3. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную vms_ssh_public_root_key 
    
    Ответ: сгенерировал ключ с помощью команды: ssh-keygen -t ed25519, eval $(ssh-agent) && ssh-add ~/.ssh/key (добавил ключ в ssh-агент)

4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть. 

    Ответ: terraform init, terraform plan, terraform apply Ошиибки которые я исправил были: platform_id = "standart-v4" Исправил на platform_id = "standard-v1" В документации сказано что стандратно используется standard-v1 так же ошибка указывала что подобного не существует cores = 1 memory = 1 core_fraction = 5 Исправил на: cores = 2 memory = 4 core_fraction = 5 Опять же следуя инструкции, так как ошибка указывала что прежние значения не верные 

5. Подключитесь к консоли ВМ через ssh и выполните команду curl ifconfig.me. Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address". Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: eval $(ssh-agent) && ssh-add Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.; image image 

6. Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ. 
    
    Ответ: сервису выгодно в плане ресурсов, нам же выгодно потому что стоимость поддержания такой вм в разы снижается


[Скриншот 1](https://github.com/AntonStogov/netology_terraform/assets/97850376/60856b42-bf56-4b9f-a446-c55481836615)

---
```
![image](https://github.com/AntonStogov/netology_terraform/assets/97850376/18aa2d66-bafb-4348-b3d0-3fb22b5f871f)
```

ЗАДАНИЕ 2: Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf. Проверьте terraform plan. Изменений быть не должно.README.md

Ответ: terraform plan
No changes. Your infrastructure matches the configuration.
variables.tf загрузил на github

ЗАДАНИЕ 3:
1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.

Ответ:
![image](https://github.com/AntonStogov/netology_terraform/assets/97850376/38ae073c-01fc-4d07-841f-2b2b34cff8cf)

ЗАДАНИЕ 4:
1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.

Ответ:
sysad@sysad-home:~/github/terraform/homework/lesson2/02/src$ terraform output 
vm_info = {
  "platform_vm_db" = {
    "external_ip" = "158.160.80.185"
    "fqdn" = "epd32i4ihr7pi8l0krs4.auto.internal"
    "instance_name" = "netology-develop-platform-db"
  }
  "platform_vm_web" = {
    "external_ip" = "51.250.87.216"
    "fqdn" = "fhm15mc7gpn00ht6snnr.auto.internal"
    "instance_name" = "netology-develop-platform-web"
  }
}
![image](https://github.com/AntonStogov/netology_terraform/assets/97850376/65032cc2-217f-4fb4-901d-5dedf182d23b)

ЗАДАНИЕ 5:
1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
3. Примените изменения.

Ответ: в качестве ответа загрузил locals.tf

ЗАДАНИЕ 6:
1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map.  
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=
       memory=
       core_fraction=
       ...
     },
     db= {
       cores=
       memory=
       core_fraction=
       ...
     }
   }
   ```
3. Создайте и используйте отдельную map переменную для блока metadata, она должна быть общая для всех ваших ВМ.
   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```  
  
5. Найдите и закоментируйте все, более не используемые переменные проекта.
6. Проверьте terraform plan. Изменений быть не должно.

Ответ:
![image](https://github.com/AntonStogov/netology_terraform/assets/97850376/66ac060a-1cec-4468-9c95-440070a42919)






