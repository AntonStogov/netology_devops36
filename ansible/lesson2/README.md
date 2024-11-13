# Домашнее задание к занятию 2 «Работа с Playbook»

### 1) Подготовьте свой inventory-файл prod.yml.

#### Ответ: 
```yaml 
---
# inventory-файл prod.yml
clickhouse:
  hosts:
    clickhouse-01:
      ansible_host: "87.242.102.66"
      ansible_user: sysad

```
---

### 2) Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает vector. Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по ссылке. не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!

#### Ответ: Дописал playbook для установки и настройки vector, использовал модули `get_url`, `apt`, `template`, `file`. Создал файл vector_config.j2 поместил его в папку templates

#### Обновленный site.yml
```yaml
---
- name: Install and configure Vector
  hosts: clickhouse
  handlers:
    - name: Restart vector service
      become: true
      ansible.builtin.systemd:
        name: vector
        state: restarted

  tasks:
    - name: Download vector
      ansible.builtin.get_url:
        url: "https://packages.timber.io/vector/{{ vector_version }}/vector_0.40.1-1_amd64.deb"
        dest: "/tmp/vector-{{ vector_version }}.deb"
        mode: '0644'  

    - name: Install vector
      become: true
      ansible.builtin.apt:
        deb: "/tmp/vector-{{ vector_version }}.deb"
        state: present

    - name: Deploy vector configuration
      ansible.builtin.template:
        src: templates/vector_config.j2
        dest: /etc/vector/vector.toml
        mode: '0644'  
      become: true
      notify: Restart vector service

    - name: Ensure vector directory exists
      ansible.builtin.file:
        path: /etc/vector
        state: directory
        mode: '0755'  
```
---

### 3) При создании tasks рекомендую использовать модули: get_url, template, unarchive, file.

#### Ответ: Использовал всё кроме `unarchive`
---

### 4) Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.

#### Ответ: 
```yaml
    - name: Download vector
      ansible.builtin.get_url:
        url: "https://packages.timber.io/vector/{{ vector_version }}/vector_0.40.1-1_amd64.deb"
        dest: "/tmp/vector-{{ vector_version }}.deb"
        mode: '0644'  

    - name: Install vector
      become: true
      ansible.builtin.apt:
        deb: "/tmp/vector-{{ vector_version }}.deb"
        state: present
```
---

### 5) Запустите ansible-lint site.yml и исправьте ошибки, если они есть.

#### Ответ: Выполнено
![image](https://github.com/user-attachments/assets/c9855390-f027-4fc1-8be9-da604e8ead13)

---

### 6) Попробуйте запустить playbook на этом окружении с флагом --check.

#### Ответ: Выполнение прерывается на моменте установки, так как пакетов установки нету в указаном месте
![image](https://github.com/user-attachments/assets/75fe4ff4-4b97-4edb-9938-cd29cada317e)

---

### 7) Запустите playbook на prod.yml окружении с флагом --diff. Убедитесь, что изменения на системе произведены.

#### Ответ: Выполнено
![image](https://github.com/user-attachments/assets/5cb1efcf-9124-4fcc-8c7c-da10b2820142)
![image](https://github.com/user-attachments/assets/c54d403d-c74b-40df-91cd-439ee7769840)

![image](https://github.com/user-attachments/assets/44f70c17-9240-436b-8bb2-6fc191d03fe4)

---

### 8) Повторно запустите playbook с флагом --diff и убедитесь, что playbook идемпотентен.

#### Ответ: Запустил убедился что playbook идемпотентен
![image](https://github.com/user-attachments/assets/07956de1-9289-40ea-b2ea-3d91d0a87568)
![image](https://github.com/user-attachments/assets/825fc504-479b-4ed6-b2b4-99105a45d2d0)

---

### 9) Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по ссылке. Так же приложите скриншоты выполнения заданий №5-8

#### Ответ: Мой playbook в общем выполняет две задачи настройку и установку Clickhouse и Vector
Параметры и теги в `Install Clickhouse`
- Handler Start clickhouse service
`name`: clickhouse-server — имя сервиса.
`state`: restarted — указывает, что сервис должен перезапускаться.
`become`: true — выполняется с привилегиями.


- Task Get clickhouse distrib
`ansible.builtin.get_url`:
`url`: URL для скачивания дистрибутива (например, "https://packages.clickhouse.com/deb/pool/main/c/{{ item }}/{{ item }}_{{ clickhouse_version }}_all.deb").
`dest`: Путь для сохранения файла на локальном хосте (например, "./{{ item }}_{{ clickhouse_version }}.deb").
`mode`: Права доступа для загружаемого файла (0644).
`with_items`: Переменная для итерации по пакетам ({{ clickhouse_packages }}).


- Task Get clickhouse common-static distrib as fallback
`ansible.builtin.get_url`:
`url`: URL для резервного пакета.
`dest`: Путь для сохранения резервного файла.
`mode`: Права доступа для резервного файла (0644).


- Task Install clickhouse packages
`ansible.builtin.apt`:
`deb`: Путь к .deb файлу (например, "./{{ item }}_{{ clickhouse_version }}.deb").
`state`: present — пакет должен быть установлен.
`loop`: Список пакетов для установки (clickhouse-common-static, clickhouse-client, clickhouse-server).
`notify`: Start clickhouse service — вызывает перезапуск сервиса после установки.


- Task Flush handlers
`ansible.builtin.meta`: flush_handlers — немедленно выполняет все отложенные действия.


- Task Create database
`ansible.builtin.command`: Запускает команду для создания базы (clickhouse-client -q 'create database logs;').
`register`: Регистрирует результат команды в переменной (create_db).
`failed_when`: Условие ошибки — если rc не равно 0 и не равно 82.
`changed_when`: Состояние изменено, если код завершения равен 0 (create_db.rc == 0).

---

Параметры и теги в Install and configure Vector
- Handler Restart vector service
`name`: vector — имя сервиса.
`state`: restarted — указывает, что сервис должен перезапускаться.
`become`: true — выполняется с привилегиями.


- Task Download vector
`ansible.builtin.get_url`:
`url`: URL для скачивания дистрибутива Vector.
`dest`: Путь для сохранения файла на локальном хосте (например, "/tmp/vector-{{ vector_version }}.deb").
`mode`: Права доступа для файла (0644).


- Task Install vector
`ansible.builtin.apt`:
`deb`: Путь к .deb файлу Vector (например, "/tmp/vector-{{ vector_version }}.deb").
`state`: present — пакет должен быть установлен.
`become`: true — выполняется с привилегиями.


- Task Deploy vector configuration
`ansible.builtin.template`:
`src`: Шаблонный файл конфигурации (templates/vector_config.j2).
`dest`: Путь для размещения файла конфигурации (/etc/vector/vector.toml).
`mode`: Права доступа для файла конфигурации (0644).
`become`: true — выполняется с привилегиями.
`notify`: Restart vector service — вызывает перезапуск сервиса Vector.


- Task Ensure vector directory exists
`ansible.builtin.file`:
`path`: Путь к каталогу (/etc/vector).
`state`: directory — указывает, что объект должен быть каталогом.
`mode`: Права доступа для каталога (0755)
  

---
### 10) Готовый playbook выложите в свой репозиторий, поставьте тег 08-ansible-02-playbook на фиксирующий коммит, в ответ предоставьте ссылку на него.
