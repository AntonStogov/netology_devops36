# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»
---

## Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера
---

### 1) Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
#### Ответ: Создал
![image](https://github.com/user-attachments/assets/263b869a-6eea-4c99-8e92-fb703f35e8c5)

https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson4/deployment.yaml
---
### 2) Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.
#### Ответ: Создал
![image](https://github.com/user-attachments/assets/af9cf683-3117-42fc-b47b-6a9577d73f92)

https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson4/service.yaml
---
### 3) Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
#### Ответ: Готово
![image](https://github.com/user-attachments/assets/e873984c-b2f8-4e8d-a1b6-52e691ce3dfb)

https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson4/multitool.yaml
---
### 4) Продемонстрировать доступ с помощью curl по доменному имени сервиса.
#### Ответ: Всё работает
![image](https://github.com/user-attachments/assets/6f2f9a9b-8ff7-4df4-bd36-9e8c600ac2c2)

![image](https://github.com/user-attachments/assets/d5e67d6c-fef1-4fcd-b65a-342c540b35ec)

---
### 5) Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.
#### Ответ: Всё предоставил в ответе под каждым заданием

---
## Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера
---

### 1) Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
#### Ответ: Готово
![image](https://github.com/user-attachments/assets/256d32b7-d524-4a0a-818c-c861c10ddc5c)

https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson4/nodeport.yaml

---
### 2) Продемонстрировать доступ с помощью браузера или curl с локального компьютера.
#### Ответ: Работает
![image](https://github.com/user-attachments/assets/af16e199-4bf6-4d0d-bb73-00d1e43d9940)


---
### 3) Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.
#### Ответ: Предоставил в ответах под задачками

---
## Правила приёма работы
---

### Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
### Файл README.md должен содержать скриншоты вывода необходимых команд kubectl и скриншоты результатов.
### Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.
