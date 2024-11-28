# Домашнее задание к занятию «Базовые объекты K8S»
---

## Задание 1. Создать Pod с именем hello-world
---

### 1. Создать манифест (yaml-конфигурацию) Pod.
#### Ответ:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hello-world
spec:
  containers:
  - name: echoserver
    image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
    ports:
    - containerPort: 8080
```
---

### 2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
#### Ответ: Использовал 

---

### 3. Подключиться локально к Pod с помощью kubectl port-forward и вывести значение (curl или в браузере).
#### Ответ:
![image](https://github.com/user-attachments/assets/26d44d6e-7605-493c-8416-ff5264d46bf3)
![image](https://github.com/user-attachments/assets/d97211f1-0fb0-48c5-96c7-16bd33e30e9e)
![image](https://github.com/user-attachments/assets/5b014fb9-6ee0-4087-9739-0f199b189331)



---

## Задание 2. Создать Service и подключить его к Pod
---

### 1. Создать Pod с именем netology-web.
#### Ответ:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: netology-web
  labels:
    app: netology-web
spec:
  containers:
  - name: echoserver
    image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
    ports:
    - containerPort: 8080
```
---

### 2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
#### Ответ: Использовал

---
 
### 3. Создать Service с именем netology-svc и подключить к netology-web.
#### Ответ:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: netology-svc
spec:
  selector:
    app: netology-web
  ports:
  - protocol: TCP
    port: 8080
    targetPort: 8080
  type: ClusterIP
```
![image](https://github.com/user-attachments/assets/7c068e7a-5478-4f63-afe8-aacfd47c730f)


---

### 4. Подключиться локально к Service с помощью kubectl port-forward и вывести значение (curl или в браузере).
#### Ответ:
![image](https://github.com/user-attachments/assets/59b383b3-d8d5-445f-8bd1-f2029eb9ba60)

---

## Правила приёма работы
---

### Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
### Файл README.md должен содержать скриншоты вывода команд kubectl get pods, а также скриншот результата подключения.
### Репозиторий должен содержать файлы манифестов и ссылки на них в файле README.md.
