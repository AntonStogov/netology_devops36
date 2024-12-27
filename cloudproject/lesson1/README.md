# Домашнее задание к занятию «Организация сети»


## Задание 1. Yandex Cloud


## Что нужно сделать

### 1) Создать пустую VPC. Выбрать зону.

### Ответ: готово
![image](https://github.com/user-attachments/assets/a8c05876-5c96-4842-90b2-e50ca970c716)

---
### 2) Публичная подсеть.
### - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
### - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
### - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.

### Ответ: Публичная подсеть создана, nat инстанс запущен, виртуалка готова
Подсети privat и public созданы
![image](https://github.com/user-attachments/assets/ce6fa406-7023-4d98-98c0-62758c5948a9)

Таблица маршрутизации настроена
![image](https://github.com/user-attachments/assets/0c19a397-8839-4c17-98b8-80b5eefe2f40)

Виртуальные машины подняты
![image](https://github.com/user-attachments/assets/91c4eb82-5636-4d9e-adf3-f99f35b2590b)

Подключился по SSH и проверил пинг с google.com
![image](https://github.com/user-attachments/assets/f94e0b50-cdbe-4818-9e7c-22f317c53bd5)


---
### 3) Приватная подсеть.
### - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
### - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
### - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

### Ответ: Подсеть создана, виртуалка поднята

Подключаемся к ВМ в приватной сети через SSH с ВМ из публичной сети
![image](https://github.com/user-attachments/assets/d89968a9-244c-41bc-94c5-2a16edf7d079)

Проверяем наличие интернета
![image](https://github.com/user-attachments/assets/9f5f51e3-002b-4753-9eba-b81066a6fc1a)

Отключаем наш NAT-инстанс
![image](https://github.com/user-attachments/assets/55216019-831c-44ff-8c44-e13f3f84d961)

Теперь интернета на ВМ в приватной сети нет
![image](https://github.com/user-attachments/assets/8e766983-10fc-481e-8d50-594b194363d4)

---
Файлы .tf
https://github.com/AntonStogov/netology_devops36/blob/main/cloudproject/lesson1/tf_file/main.tf
https://github.com/AntonStogov/netology_devops36/blob/main/cloudproject/lesson1/tf_file/nat_instance.tf
https://github.com/AntonStogov/netology_devops36/blob/main/cloudproject/lesson1/tf_file/network.tf
https://github.com/AntonStogov/netology_devops36/blob/main/cloudproject/lesson1/tf_file/providers.tf
https://github.com/AntonStogov/netology_devops36/blob/main/cloudproject/lesson1/tf_file/public.tf
https://github.com/AntonStogov/netology_devops36/blob/main/cloudproject/lesson1/tf_file/variables.tf
