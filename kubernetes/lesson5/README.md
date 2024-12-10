# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»
---

## Задание 1. Создать Deployment приложений backend и frontend
---
### 1) Создать Deployment приложения frontend из образа nginx с количеством реплик 3 шт.
#### Ответ: готово
![image](https://github.com/user-attachments/assets/3d35c0a6-fcd8-403e-94bf-0e456548c2d8)

https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson5/frontend_dep.yaml

---
### 2) Создать Deployment приложения backend из образа multitool.
#### Ответ: готово
![image](https://github.com/user-attachments/assets/5bdbb33f-553e-44d9-bc3e-0c6ecde1589b)

https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson5/backend_dep.yaml
---
### 3) Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера.
#### Ответ: добавил
![image](https://github.com/user-attachments/assets/1dd28746-ec72-4a9d-9c34-14bed3b122aa)

https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson5/service.yaml
---
### 4) Продемонстрировать, что приложения видят друг друга с помощью Service.
#### Ответ: сделано
![image](https://github.com/user-attachments/assets/1849e7a2-12bc-47d8-858e-43e861b071e4)
![image](https://github.com/user-attachments/assets/f4b2d5fb-0a13-40de-b50a-ff070724fc12)
![image](https://github.com/user-attachments/assets/b7f6b9ad-2123-4182-b7ae-627dcf9ed6d9)
![image](https://github.com/user-attachments/assets/4134042b-30cc-4ed8-9df2-1f53e3dd447d)


---
### 5) Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.
#### Ответ: готово все скриншоты и манифесты прикреплены к заданию

---
## Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера
---
### 1) Включить Ingress-controller в MicroK8S.
#### Ответ: включил командой microk8s enable ingress

---
### 2) Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался frontend а при добавлении /api - backend.
#### Ответ: создал
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson5/ingress.yaml

---
### 3) Продемонстрировать доступ с помощью браузера или curl с локального компьютера.
#### Ответ: прикрепляю скриншоты
![image](https://github.com/user-attachments/assets/111ea91b-2f32-4685-894e-bc328b8f3d82)
![image](https://github.com/user-attachments/assets/4b663901-d5ba-44a8-9bf7-8e2a1d3c46a9)


---
### 4)Предоставить манифесты и скриншоты или вывод команды п.2.
#### Ответ: предоставил скриншоты и манифест ingress.yaml

---
## Правила приема работы
---
### Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
### Файл README.md должен содержать скриншоты вывода необходимых команд kubectl и скриншоты результатов.
### Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.

