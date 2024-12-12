# Домашнее задание к занятию «Хранение в K8s. Часть 2»
---
### Задание 1
### Что нужно сделать
### Создать Deployment приложения, использующего локальный PV, созданный вручную.
---
#### 1) Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
#### Ответ:
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson7/deployment.yaml
![image](https://github.com/user-attachments/assets/72a36892-b2fe-4589-8177-a0299c73509f)

---
#### 2) Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.
#### Ответ:
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson7/pv.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson7/pvc.yaml
![image](https://github.com/user-attachments/assets/1e5491d8-bfa6-4943-b3f7-a408fac17c31)
![image](https://github.com/user-attachments/assets/4e450eb3-0f5c-4863-a080-f94c63b4307d)
Статус пода изменился
![image](https://github.com/user-attachments/assets/c85f26a6-c7ce-4d12-b875-6ae680bf58aa)


---
#### 3) Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории.
#### Ответ:
![image](https://github.com/user-attachments/assets/adf6ad98-56b9-4810-b64c-ee4162693bdf)


---
#### 4) Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.
#### Ответ: После удаления PVC, PV останется в состоянии Released. Это связано с тем, что persistentVolumeReclaimPolicy: Delete удаляет данные только при полном удалении PV.
![image](https://github.com/user-attachments/assets/490dcadf-c723-4df3-a122-9b6b44af6bc3)
![image](https://github.com/user-attachments/assets/fbc3f622-1cfc-4255-8ad8-b09f822bad01)


---
#### 5) Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV. Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.
#### Ответ:
![image](https://github.com/user-attachments/assets/fd89e752-4646-46aa-b481-224ce27a6971)

#### после удаления pv: Удаление PV не удаляет данные, поскольку это физический ресурс. Файлы нужно удалить вручную.

![image](https://github.com/user-attachments/assets/7bf079ac-7f63-4e20-9e04-9735b488c4df)


---
#### 6) Предоставить манифесты, а также скриншоты или вывод необходимых команд.
#### Ответ: Всё прикрепил к ответам на вопросы

---
### Задание 2
### Что нужно сделать
### Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.
---

#### 1) Включить и настроить NFS-сервер на MicroK8S.
#### Ответ: 
sudo apt update
sudo apt install -y nfs-kernel-server
sudo mkdir -p /srv/nfs-share
sudo chmod 777 /srv/nfs-share
Настроить /etc/exports:
/srv/nfs-share *(rw,sync,no_subtree_check,no_root_squash)
sudo exportfs -ra
sudo systemctl restart nfs-kernel-server

---
#### 2) Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.
#### Ответ:
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson7/deploy_nfs.yaml
https://github.com/AntonStogov/netology_devops36/blob/main/kubernetes/lesson7/nfs_pvc.yaml
![image](https://github.com/user-attachments/assets/a5c8f1e1-03ca-43d1-ab80-1e43d56ae10d)
![image](https://github.com/user-attachments/assets/8c54f395-96ea-4fd5-965e-f54e4296b6a5)

---
#### 3) Продемонстрировать возможность чтения и записи файла изнутри пода.
#### Ответ:
![image](https://github.com/user-attachments/assets/8ac11df4-60a0-4c83-95dd-433786dd5100)
![image](https://github.com/user-attachments/assets/c1cfba2f-f9b0-47ae-a238-dfa58a891212)
![image](https://github.com/user-attachments/assets/353240bd-8c3c-484a-8f8b-c8671c36eb37)



---
#### 4) Предоставить манифесты, а также скриншоты или вывод необходимых команд.
#### Ответ: Прикрепил к ответам на вопрос

---
### Правила приёма работы
---

#### Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное задание пришлите ссылкой на .md-файл в вашем репозитории.
#### Файл README.md должен содержать скриншоты вывода необходимых команд kubectl, а также скриншоты результатов.
#### Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.
