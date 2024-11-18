# Домашнее задание к занятию 3 «Использование Ansible»
### 1) Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
```yaml
---
- name: Install and configure Lighthouse
  hosts: lighthouse
  gather_facts: false
  remote_user: sysad
  tags: lighthouse

  handlers:
    - name: Start Lighthouse service
      become: true
      ansible.builtin.systemd:
        daemon_reload: true
        enabled: false
        name: nginx.service
        state: restarted

  tasks:
    - name: Install, configure, and start Lighthouse
      block:
        - name: Pre-install Nginx & Git client
          become: true
          ansible.builtin.apt:
            name: "{{ lighthouse_packages }}"
            update_cache: true

        - name: Clone Lighthouse source code by Git
          become: true
          block:
            - name: Check if git repository already exists
              ansible.builtin.stat:
                path: "{{ lighthouse_data_dir }}/.git"
              register: git_repo

            - name: Clone Lighthouse repository
              ansible.builtin.git:
                repo: "{{ lighthouse_code_src }}"
                version: "{{ lighthouse_code_src_version }}"
                dest: "{{ lighthouse_data_dir }}"
                force: false
              when: not git_repo.stat.exists  # Выполняем только если репозиторий отсутствует

        - name: Prepare nginx config
          become: true
          ansible.builtin.template:
            src: "templates/lighthouse_config.j2"
            dest: "/etc/nginx/conf.d/{{ lighthouse_nginx_conf }}"
            mode: "0644"
            owner: root
            group: root
          notify: Start Lighthouse service

```
---

### 2) При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`. 
#### Ответ: Использовал `template`, `apt`, `systemd` и другие.

---

### 3) Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер. 
#### Ответ: добавлен play для запуска и настройки lighthouse
```
server {
    listen {{ lighthouse_nginx_port }};
    server_name 0.0.0.0;

    access_log /var/log/nginx/lighthouse-access.log;

    location / {
        root {{ lighthouse_data_dir }};
        index index.html;
    }

    location /clickhouse {
        proxy_pass http://176.123.166.245:8123;
        proxy_set_header Host $host;
    }
}
```
---

### 4) Подготовьте свой inventory-файл prod.yml.
```yaml
clickhouse:
  hosts:
    clickhouse:
      ansible_host: "176.123.166.245"
      ansible_user: sysad
      
vector:
  hosts:
    vector:
      ansible_host: "185.50.202.61"
      ansible_user: sysad

lighthouse:
  hosts:
    lighthouse:
      ansible_host: "87.242.102.66"
      ansible_user: sysad
```
---

### 5) Запустите ansible-lint site.yml и исправьте ошибки, если они есть.
![image](https://github.com/user-attachments/assets/4ba5e3e4-8e3c-4fbe-9fd0-a87986a4b1de)
![image](https://github.com/user-attachments/assets/18e6e614-dea9-40a1-9319-a1f8aee0b89a)


---

### 6) Попробуйте запустить playbook на этом окружении с флагом --check.
![image](https://github.com/user-attachments/assets/57100732-6acb-453f-9692-4a497645e8a6)


---

### 7) Запустите playbook на prod.yml окружении с флагом --diff. Убедитесь, что изменения на системе произведены.
![image](https://github.com/user-attachments/assets/dba57c3c-2267-442c-90b8-fb526f145528)
![image](https://github.com/user-attachments/assets/e2f1be7a-9b3c-4252-ba2c-0b4ea726a444)
![image](https://github.com/user-attachments/assets/b6681bc7-74d7-4e1c-aa13-e804e7882598)
![image](https://github.com/user-attachments/assets/0ae926bc-3b2c-41a0-a27c-46ec64341967)
![image](https://github.com/user-attachments/assets/1236cad9-e4b1-464e-ac2d-f26c2e758aa3)


---

### 8) Повторно запустите playbook с флагом --diff и убедитесь, что playbook идемпотентен.
![image](https://github.com/user-attachments/assets/482cdda0-f350-4089-bed8-4f261971c36b)
![image](https://github.com/user-attachments/assets/0f099bd8-6ab0-4b48-b66d-0d7f6792f68e)

---

### 9) Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
```
- Параметры:
hosts: lighthouse — Указывает, что плейбук должен выполняться на хостах, которые принадлежат группе lighthouse в инвентарном файле.

gather_facts: false — Отключает сбор фактов о хостах перед выполнением задач. Это ускоряет выполнение плейбука, если факты не требуются для работы.

remote_user: sysad — Используется пользователь sysad для выполнения команд на удаленных хостах.

tags: lighthouse — Тег, который позволяет запускать или пропускать задачи плейбука, связанные с Lighthouse. Это полезно для фильтрации и выполнения только тех частей плейбука, которые помечены этим тегом.

- Handlers:
Start Lighthouse service — Хендлер для перезапуска сервиса Nginx после того, как будут применены изменения конфигурации.
become: true — Привилегии суперпользователя для перезапуска сервиса.
ansible.builtin.systemd — Используется для управления системой и сервисами. В данном случае, перезапускается сервис Nginx с настройкой daemon_reload: true, чтобы учитывать изменения в конфигурации.
- Tasks:
Установка и настройка Lighthouse:

Pre-install Nginx & Git client — Задача для установки пакетов Nginx и Git на хостах с использованием менеджера пакетов APT.
name: "{{ lighthouse_packages }}" — Переменная, содержащая список пакетов для установки (например, Nginx, Git).
Клонирование исходного кода Lighthouse:

Проверка существования репозитория в директории данных.
Если репозиторий не найден, выполняется клонирование из указанного источника с использованием Ansible модуля git.
when: not git_repo.stat.exists — Условие, которое гарантирует, что репозиторий будет клонирован только в том случае, если его еще нет в целевой директории.
- Настройка конфигурации Nginx:

Используется шаблон конфигурации lighthouse_config.j2, который копируется на хост и сохраняется в каталоге конфигурации Nginx.
notify: Start Lighthouse service — Если задача успешна, хендлер перезапускает Nginx, чтобы применить изменения в конфигурации.
- Переменные:
lighthouse_packages — Переменная, содержащая список пакетов для установки (например, nginx, git).
lighthouse_data_dir — Директория, в которой будет размещен исходный код Lighthouse, например, /var/www/lighthouse.
lighthouse_code_src — URL репозитория Lighthouse для клонирования.
lighthouse_code_src_version — Версия или ветка репозитория для клонирования.
lighthouse_nginx_conf — Имя конфигурационного файла для Nginx, например, lighthouse.conf.
- Теги:
lighthouse — Тег, позволяющий запускать или пропускать части плейбука, относящиеся к установке и настройке Lighthouse. Теги полезны для выборочного выполнения задач, если нужно протестировать или настроить только часть плейбука.
```
---

### 10) Готовый playbook выложите в свой репозиторий, поставьте тег 08-ansible-03-yandex на фиксирующий коммит, в ответ предоставьте ссылку на него.
