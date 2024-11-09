## Домашнее задание к занятию 1 «Введение в Ansible»
---
### 1) Попробуйте запустить playbook на окружении из test.yml, зафиксируйте значение, которое имеет факт some_fact для указанного хоста при выполнении playbook.

Ответ: Использовал команду находясь в папке playbook: ansible-playbook -i inventory/test.yml site.yml, значение = "12"
---

### 2)Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на all default fact.
Ответ: Изменил
---

### 3)Воспользуйтесь подготовленным (используется docker) или создайте собственное окружение для проведения дальнейших испытаний.
Ответ: docker run -d --name [имя контейнера] --user=root [контейнер:версия] tail -f /dev/null 
tail -f /dev/null по сути следит за пустым файлом, что позволяет контейнеру оставаться запущенным в фоновом режиме
Я воспользовался контейнером ubuntu:latest и rockylinux:9
---

### 4)Проведите запуск playbook на окружении из prod.yml. Зафиксируйте полученные значения some_fact для каждого из managed host.
Ответ: Ответ на скриншоте
---

### 5)Добавьте факты в group_vars каждой из групп хостов так, чтобы для some_fact получились значения: для deb — deb default fact, для el — el default fact.
Ответ: Сделал для deb — deb default fact, для el — el default fact.
---

### 6)Повторите запуск playbook на окружении prod.yml. Убедитесь, что выдаются корректные значения для всех хостов.
Ответ: Ответ на скриншоте
---

### 7)При помощи ansible-vault зашифруйте факты в group_vars/deb и group_vars/el с паролем netology.
Ответ: ansible-vault encrypt group_vars/deb/examp.yml --vault-password-file <(echo "netology")
ansible-vault encrypt group_vars/el/examp.yml --vault-password-file <(echo "netology")
---

### 8)Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь в работоспособности.
Ответ: ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
Скриншот
---

### 9)Посмотрите при помощи ansible-doc список плагинов для подключения. Выберите подходящий для работы на control node.
Ответ: Для работы на control mode подходит плагин local
ansible-doc -t connection local
---

### 10)В prod.yml добавьте новую группу хостов с именем local, в ней разместите localhost с необходимым типом подключения.\
Ответ: 
  all:
    hosts:
      localhosts:
        ansible_connection: local
---

### 11)Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь, что факты some_fact для каждого из хостов определены из верных group_vars.
Ответ: ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
---




