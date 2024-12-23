# Домашнее задание к занятию «Helm»
---

## Задание 1. Подготовить Helm-чарт для приложения
---

### 1) Необходимо упаковать приложение в чарт для деплоя в разные окружения.
#### Ответ: устанавливаю helm и настраиваю для дальнейшей работы
![image](https://github.com/user-attachments/assets/6b1da063-1053-4f05-ab61-7f94db218515)
![image](https://github.com/user-attachments/assets/a3388105-d37d-4d0d-9eb4-f14833ef4614)
![image](https://github.com/user-attachments/assets/019fb21c-5225-453b-9ce8-1c5bca027c3c)


---
### 2) Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.
#### Ответ: готово
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson10/my-app/values.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson10/my-app/deployment.yaml

---
### 3) В переменных чарта измените образ приложения для изменения версии.
#### Ответ: готово
![image](https://github.com/user-attachments/assets/0161f715-0966-45fb-9b5b-e2ec8a48b248)

---
## Задание 2. Запустить две версии в разных неймспейсах
---

### 1) Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.
#### Ответ: создаю два namespace для запуска в разных namespace
![image](https://github.com/user-attachments/assets/1c50cd75-a048-4888-a9ff-1aac6e67d2b6)


---
### 2) Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.
#### Ответ: готово
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson10/my-app/values_app1.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson10/my-app/values_app2.yaml

---
### 3) Продемонстрируйте результат.
#### Ответ: результаты
![image](https://github.com/user-attachments/assets/e78e89bf-1671-48fb-9738-ef52b66f4c90)
![image](https://github.com/user-attachments/assets/a4592ed6-1cda-41ad-8232-1b2b387c3033)
![image](https://github.com/user-attachments/assets/3aa218ba-8d2d-40bf-a33b-5f6a2315cb50)


---
## Правила приёма работы
---

### Домашняя работа оформляется в своём Git репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
### Файл README.md должен содержать скриншоты вывода необходимых команд kubectl, helm, а также скриншоты результатов.
### Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.
