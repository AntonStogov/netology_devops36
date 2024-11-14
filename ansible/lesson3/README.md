# Домашнее задание к занятию 3 «Использование Ansible»
### 1) Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
```yaml
---
- name: Lighthouse
  hosts: lighthouse
  gather_facts: false
  remote_user: user
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
          ansible.builtin.git:
            repo: "{{ lighthouse_code_src }}"
            version: "{{ lighthouse_code_src_version }}"
            dest: "{{ lighthouse_data_dir }}"

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
#### Ответ: Использовал `template`, `apt` и другие.

---

### 3) Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер. 
#### Ответ: добавлен play для запуска и настройки lighthouse
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


---

### 8) Повторно запустите playbook с флагом --diff и убедитесь, что playbook идемпотентен.
```
```
---

### 9) Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
```
```
---

### 10) Готовый playbook выложите в свой репозиторий, поставьте тег 08-ansible-03-yandex на фиксирующий коммит, в ответ предоставьте ссылку на него.
