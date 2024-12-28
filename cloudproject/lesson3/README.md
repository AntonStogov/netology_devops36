# Домашнее задание к занятию «Безопасность в облачных провайдерах»


## Задание 1. Yandex Cloud


### 1) С помощью ключа в KMS необходимо зашифровать содержимое бакета:
### - создать ключ в KMS;
### - с помощью ключа зашифровать содержимое бакета, созданного ранее.

### Ответ: Создал ключ, зашифровал содержимое бакета:
![image](https://github.com/user-attachments/assets/1684c3a3-9077-4029-b8eb-beabe5296699)
![image](https://github.com/user-attachments/assets/0dd69183-7f2f-4723-893c-d0859213f72e)
![image](https://github.com/user-attachments/assets/c629b6b0-eeed-4487-ac3c-2860c8727872)
![image](https://github.com/user-attachments/assets/d2eacb35-9292-41b6-b0f0-9b9b5f664809)

---
### 2) (Выполняется не в Terraform)* Создать статический сайт в Object Storage c собственным публичным адресом и сделать доступным по HTTPS:
### - создать сертификат;
### - создать статическую страницу в Object Storage и применить сертификат HTTPS;
### - в качестве результата предоставить скриншот на страницу с сертификатом в заголовке (замочек).

### Ответ: Готово, сертификат выпущен, страница создана и загружена открывается через https
![image](https://github.com/user-attachments/assets/6dc7a447-41af-4450-9d31-22bc6e39ac4e)
![image](https://github.com/user-attachments/assets/96c085c5-3bad-49c9-955c-4178d14e2deb)
![image](https://github.com/user-attachments/assets/c02649cb-e25e-42ff-89ec-15e6fa6a505c)
![image](https://github.com/user-attachments/assets/fd10fa74-bf5f-4b01-834f-2f56759e247f)

Все файлы .tf можно посмотреть по ссылке:
https://github.com/AntonStogov/netology_devops36/tree/main/cloudproject/lesson3/tf_file
