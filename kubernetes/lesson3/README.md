# Домашнее задание к занятию «Запуск приложений в K8S»
---

## Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod
---

### 1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
#### Ответ: создал
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson3/app-deployment.yaml

---

### 2. После запуска увеличить количество реплик работающего приложения до 2.
#### Ответ: готово

---


### 3. Продемонстрировать количество подов до и после масштабирования.
#### Ответ: готово
![image](https://github.com/user-attachments/assets/339de1d0-c654-451e-92c4-d4ae01cb0ea1)
![image](https://github.com/user-attachments/assets/8d1867ef-e445-4d0a-ab63-05b475816f45)

---


### 4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
#### Ответ: готово
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson3/app-service.yaml

![image](https://github.com/user-attachments/assets/0ab40579-924c-4b2c-a2cd-bd116e092d6f)

---


### 5. Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложений из п.1.
#### Ответ: готово
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson3/multitool-checker.yaml

![image](https://github.com/user-attachments/assets/5190bd04-5401-49cd-b194-512daf1eead3)
![image](https://github.com/user-attachments/assets/c7ffd90d-ae09-465a-94de-ae3b528d96fb)

---


## Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий
---

### 1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
#### Ответ: готово
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson3/nginx-init.yaml

---


### 2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
#### Ответ: готово
![image](https://github.com/user-attachments/assets/cc1ded37-51fb-4ced-bf9f-40b9d0b9565d)

---


### 3. Создать и запустить Service. Убедиться, что Init запустился.
#### Ответ: готово

https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson3/nginx-init-service.yaml

---


### 4. Продемонстрировать состояние пода до и после запуска сервиса.
#### Ответ: готово

![image](https://github.com/user-attachments/assets/c06b15a7-e3d2-4f33-b9e9-344a37fa3f2c)
![image](https://github.com/user-attachments/assets/55806278-6867-49eb-b05f-7eb3e1559c97)

---


## Правила приема работы
---

### Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
### Файл README.md должен содержать скриншоты вывода необходимых команд kubectl и скриншоты результатов.
### Репозиторий должен содержать файлы манифестов и ссылки на них в файле README.md.
