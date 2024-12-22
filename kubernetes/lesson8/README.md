# Домашнее задание к занятию «Конфигурация приложений»


## Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу


### 1) Создать Deployment приложения, состоящего из контейнеров nginx и multitool.
#### Ответ: Создано
![image](https://github.com/user-attachments/assets/7d205518-0b2d-4109-8bb9-cdfb21d1a0de)
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson8/deployment.yaml


---
### 2) Решить возникшую проблему с помощью ConfigMap.
#### Ответ: Проблема была решена с помощью gonfigmap
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson8/configman.yaml


---
### 3) Продемонстрировать, что pod стартовал и оба конейнера работают.
#### Ответ: всё заработало после apply configman.yaml
![image](https://github.com/user-attachments/assets/34a87a65-1f71-4ee8-8678-bac12aa67238)

---
### 4) Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.
#### Ответ: готово
![image](https://github.com/user-attachments/assets/ef032346-dfe3-43ea-92a7-f487c21ae430)


---
### 5) Предоставить манифесты, а также скриншоты или вывод необходимых команд.
#### Ответ: прикрепил манифесты к каждому пункту задания
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson8/service.yaml

---
## Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS
### 1) Создать Deployment приложения, состоящего из Nginx.
#### Ответ: создал
![image](https://github.com/user-attachments/assets/ffb3d41f-0b87-48ac-ada3-695c9ffe8f64)


---
### 2) Создать собственную веб-страницу и подключить её как ConfigMap к приложению.
#### Ответ: создаю собстевенную веб-страницу
![image](https://github.com/user-attachments/assets/25e5bf2e-8a26-4666-b047-e36446334dce)


---
### 3) Выпустить самоподписной сертификат SSL. Создать Secret для использования сертификата.
#### Ответ: готово
![image](https://github.com/user-attachments/assets/3149a4bd-eba6-4dc2-ade5-bb88448fc1ce)
![image](https://github.com/user-attachments/assets/a3f7bde6-eeaa-4a36-aab8-a91eb132594c)
![image](https://github.com/user-attachments/assets/425fc223-65c7-4daf-98b9-2fc26484108c)


---
### 4) Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстировать доступ к приложению по HTTPS.
#### Ответ: всё работает
![image](https://github.com/user-attachments/assets/70cdb81e-2066-4718-a008-d20e828c1932)
![image](https://github.com/user-attachments/assets/9fb99e2f-1763-42c8-b619-e083ae2a9f13)


---
### 5) Предоставить манифесты, а также скриншоты или вывод необходимых команд.
#### Ответ: манифесты предоставляю
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson8/nginx_dep.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson8/nginx_configmap.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson8/nginx_service.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson8/nginx_ingress.yaml


---
## Правила приёма работы
---

### Домашняя работа оформляется в своём GitHub-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
### Файл README.md должен содержать скриншоты вывода необходимых команд kubectl, а также скриншоты результатов.
### Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.
