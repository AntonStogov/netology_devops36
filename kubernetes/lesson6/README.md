# Домашнее задание к занятию «Хранение в K8s. Часть 1»
---
### Задание 1
### Что нужно сделать
### Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.
---
### 1) Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
#### Ответ: создано
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson6/busybox.yaml
![image](https://github.com/user-attachments/assets/a6c578de-e425-4856-9867-20e63902255b)


---
### 2) Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
#### Ответ: готово


---
### 3) Обеспечить возможность чтения файла контейнером multitool.
#### Ответ: готово
kubectl exec -it volumes-test-6d97584b95-qwxwl -c multitool -n volume1 -- cat /testvolume/success.txt
![image](https://github.com/user-attachments/assets/6fb171de-b578-4eb1-bb9a-724dd4375e07)


---
### 4) Продемонстрировать, что multitool может читать файл, который периодоически обновляется.
#### Ответ: проверяем:
kubectl exec -it volumes-test-6d97584b95-qwxwl -c multitool -n volume1 -- tail -f /testvolume/success.txt
![image](https://github.com/user-attachments/assets/10d45794-527f-4af1-9fc2-6e839492f156)

---
### 5) Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.
#### Ответ: манифесты и скриншоты прикрепил ответами на вопрос.

---

## Задание 2

## Что нужно сделать

## Создать DaemonSet приложения, которое может прочитать логи ноды.
---

### 1) Создать DaemonSet приложения, состоящего из multitool.
#### Ответ: готово
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson6/daemonset.yaml
![image](https://github.com/user-attachments/assets/7b0e4b99-5211-4648-88ae-22e36c33ea73)

---
### 2) Обеспечить возможность чтения файла /var/log/syslog кластера MicroK8S.
#### Ответ: готово

---
### 3) Продемонстрировать возможность чтения файла изнутри пода.
#### Ответ: выполнено
![image](https://github.com/user-attachments/assets/48054f7f-b851-4e0b-9011-d4f094c492d9)


---
### 4) Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.
#### Ответ: выполнено, манифест и скриншоты приложил к ответам


---
## Правила приёма работы
### Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное задание пришлите ссылкой на .md-файл в вашем репозитории.
### Файл README.md должен содержать скриншоты вывода необходимых команд kubectl, а также скриншоты результатов.
### Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.
