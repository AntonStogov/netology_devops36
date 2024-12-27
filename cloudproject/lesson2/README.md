# Домашнее задание к занятию «Вычислительные мощности. Балансировщики нагрузки»


## Задание 1. Yandex Cloud

## Что нужно сделать

### 1) Создать бакет Object Storage и разместить в нём файл с картинкой:
### - Создать бакет в Object Storage с произвольным именем (например, имя_студента_дата).
### - Положить в бакет файл с картинкой.
### - Сделать файл доступным из интернета.

### Ответ: Создал, sysad-DD-MM-YYYY, картинка загружена и доступна из интернета
![image](https://github.com/user-attachments/assets/013487b4-95f1-4c64-9d48-581f5dd9ad2c)
![image](https://github.com/user-attachments/assets/2eadf48a-859e-4f94-956b-843a5f28c780)
получаем ссылку, проверяем доступность
curl -O https://storage.yandexcloud.net/sysad-27-12-2024/happy_new_year.jpg
![image](https://github.com/user-attachments/assets/d81f0f32-a8c3-4fc6-a781-547f3a260aaa)
yc load-balancer network-load-balancer get --name lamp-balancer
address: 158.160.147.30
![image](https://github.com/user-attachments/assets/8f44723f-87da-4d2d-a759-2786408967a6)

---
### 2) Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:
### - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать image_id = fd827b91d99psvq5fjit.
### - Для создания стартовой веб-страницы рекомендуется использовать раздел user_data в meta_data.
### - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
### - Настроить проверку состояния ВМ.

### Ответ: Группа ВМ фиксированного размера с шаблоном LAMp и веб-страницей созданы и работаюь, каждая из них содержит картинку и бакета. Проверка здоровья будет выполняться каждые 30 секунд и будет считаться успешной, если подключение к порту 80 виртуальной машины происходит успешно в течении 10 секунд.
![image](https://github.com/user-attachments/assets/ef8ee0e9-85aa-4f40-8fba-874fd653a80d)
![image](https://github.com/user-attachments/assets/40d4a3ec-ec0a-4238-9630-bdac3ed7fd8e)
![image](https://github.com/user-attachments/assets/09c59815-fd12-48c9-ae53-a3f3dced9f8e)
![image](https://github.com/user-attachments/assets/704b9e43-5ace-4ab5-b43f-1cee3a2f0084)

---
### 3) Подключить группу к сетевому балансировщику:
### - Создать сетевой балансировщик.
### - Проверить работоспособность, удалив одну или несколько ВМ.

### Ответ: Подключил группу к сетевому балансировщику, удалил одну ВМ, вторую остановил, сайт по прежнему доступен, спустя некоторое время после срабатывания Healthcheck, выключенные виртуальные машины LAMP снова запустились.
![image](https://github.com/user-attachments/assets/b97d3be6-6a00-4601-bcec-6d3e5ab72b2e)
![image](https://github.com/user-attachments/assets/318ddae4-cf1e-4eab-8bbb-d6886c7280d1)
![image](https://github.com/user-attachments/assets/1bd3cea0-881d-41a9-86ed-bf89578eeb55)

---
### 4) (дополнительно)* Создать Application Load Balancer с использованием Instance group и проверкой состояния.

### Ответ: Создал Application Load Balancer с использованием Instance group и проверкой состояния.
Проверка ресурсов после применения кода
![image](https://github.com/user-attachments/assets/1606c778-8b12-4952-a3a5-a28788d5a206)

Все .tf файлы находятся по ссылке:
https://github.com/AntonStogov/netology_devops36/tree/main/cloudproject/lesson2/tf_file

