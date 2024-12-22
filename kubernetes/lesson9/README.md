Домашнее задание к занятию «Управление доступом»


## Задание 1. Создайте конфигурацию для подключения пользователя


### 1) Создайте и подпишите SSL-сертификат для подключения к кластеру.
#### Ответ: Создаю файл ключа с помощью openssl, создаю запрос на подписание сертификата, генерирую файл сертификата.
![image](https://github.com/user-attachments/assets/a74b62b0-e50e-4e2c-ab9f-d25ca46c4dbe)
![image](https://github.com/user-attachments/assets/14416e77-9411-45b8-872d-07ffad3db32b)
![image](https://github.com/user-attachments/assets/5660bd6d-32c4-4bcf-9568-7820b1aec219)


---
### 2) Настройте конфигурационный файл kubectl для подключения.
#### Ответ: готово пользователь staff, новый контекст staff-context
![image](https://github.com/user-attachments/assets/a51d8b26-bec1-438d-9f78-eddf033b8581)
![image](https://github.com/user-attachments/assets/8c418e9e-41b2-449d-a958-a841a75f1a1e)
![image](https://github.com/user-attachments/assets/c0a7a2a2-4fa4-4056-b641-7231906fba6f)

---
### 3) Создайте роли и все необходимые настройки для пользователя.
#### Ответ: всё будем делать в новом namespace access-user
![image](https://github.com/user-attachments/assets/bed30575-e5ac-4bcc-8bb3-d18eabd086fc)
![image](https://github.com/user-attachments/assets/f001537b-d788-464d-a4e3-1aaf1cdbb4da)
![image](https://github.com/user-attachments/assets/38eb317b-0702-439a-894a-9387113fa15a)
![image](https://github.com/user-attachments/assets/e855c700-bee1-4c23-92f9-9b7ee77fbe42)
![image](https://github.com/user-attachments/assets/50230f4f-9047-489f-9bde-95008ba5cfc2)

---
### 4) Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (kubectl logs pod <pod_id>, kubectl describe pod <pod_id>).
#### Ответ: всё готово предоставляю скриншоты команд и логов
![image](https://github.com/user-attachments/assets/f4168f5e-b020-41bd-8c46-52faad1df8aa)
![image](https://github.com/user-attachments/assets/7a704e87-bf1d-44eb-aabf-3630706be55e)
![image](https://github.com/user-attachments/assets/677f5ded-7b3c-4836-87d9-02d065208c19)
![image](https://github.com/user-attachments/assets/67824401-cdcc-4db5-9134-1d7cc0e2cd53)
![image](https://github.com/user-attachments/assets/0f3e0294-012e-47df-ad63-1bed2cc77985)
![image](https://github.com/user-attachments/assets/e73400f8-1712-4da2-b71f-3e9ca776d7c4)
![image](https://github.com/user-attachments/assets/30e4481c-43f3-4bdc-8dcb-279a037531b9)

---
### 5) Предоставьте манифесты и скриншоты и/или вывод необходимых команд.
#### Ответ: манифесты
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson9/deployment.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson9/role.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson9/rolebinding.yaml

---
## Правила приёма работы
---
### Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
### Файл README.md должен содержать скриншоты вывода необходимых команд kubectl, скриншоты результатов.
### Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.
