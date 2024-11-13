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

#### Ответ:
---

### 6) Попробуйте запустить playbook на этом окружении с флагом --check.

#### Ответ:
---

### 7) Запустите playbook на prod.yml окружении с флагом --diff. Убедитесь, что изменения на системе произведены.

#### Ответ:
---

### 8) Повторно запустите playbook с флагом --diff и убедитесь, что playbook идемпотентен.

#### Ответ:
---

### 9) Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по ссылке. Так же приложите скриншоты выполнения заданий №5-8
### 10) Готовый playbook выложите в свой репозиторий, поставьте тег 08-ansible-02-playbook на фиксирующий коммит, в ответ предоставьте ссылку на него.
