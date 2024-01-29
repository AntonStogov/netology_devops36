![image](https://github.com/AntonStogov/netology_terraform/assets/97850376/77bc20ed-a800-4a4e-bb8d-a6b798f2cd38)
Ответы на вопросы:
1) Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
   Переходим в канал src и используем команду terraform init
2) Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?
   Согласно файлу .gitignore допустимо сохранить личную информацию в файле: personal.auto.tfvars
3) Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
   terraform apply
   "result": "Tv5G23EiLUGChc13"
4) Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
   terraform validate
    Error: Missing name for resource 
│ 
│   on main.tf line 23, in resource "docker_image":
│   23: resource "docker_image" {
│ 
│ All resource blocks must have 2 labels (type, name).
╵
╷
│ Error: Invalid resource name
│ 
│   on main.tf line 28, in resource "docker_container" "1nginx":
│   28: resource "docker_container" "1nginx" {
│ 
│ A name must start with a letter or underscore and may contain only letters, digits, underscores, and dashes.

В первой ошибке указан тип, но не указано имя прописываем имя "nginx"
Во второй ошибке имя начинается с цифры 1, исправляем на "nginx"
Используем команду:
terraform validate
получаем следующую ошибку:
╷
│ Error: Reference to undeclared resource
│ 
│   on main.tf line 30, in resource "docker_container" "nginx":
│   30:   name  = "example_${random_password.random_string_FAKE.resulT}"
│ 
│ A managed resource "random_password" "random_string_FAKE" has not been declared in the root module.
╵
Исправляем 30 строку на: name  = "example_${random_password.random_string.result}"

Используем команду:
terraform validate
Success! The configuration is valid.

5)Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.
  CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
3ca78b213f24   a8758716bb6a   "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   0.0.0.0:9090->80/tcp   example_1By9B1QL48oz0Sor

6) Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest".
Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды docker ps.
terraform apply -help помощь помогает нам найти необходимы ключ -auto-approve и его описание: Skip interactive approval of plan before applying. (Пропустите интерактивное утверждение плана перед подачей заявки.)
Опасность этого ключа заключается в том что мы пропускаем подтверждение команды terraform apply сразу применяя изменения

CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                  NAMES
b322e1192f2f   a8758716bb6a   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:9090->80/tcp   example_1By9B1QL48oz0Sor

7) Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
terraform destroy
Содержимое файла terraform.tfstate:
{
  "version": 4,
  "terraform_version": "1.7.0",
  "serial": 15,
  "lineage": "593d45ea-f8a3-66f9-4cac-985dc5f35a6e",
  "outputs": {},
  "resources": [],
  "check_results": null
}

8)Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ обязательно подкрепите строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )
Судя по ответу из документации снизу, при изменении аргумента keep_locally на значение на =false, то образ будет удален
keep_locally(Boolean) Если true, образ Docker не будет удален при операции уничтожения. Если это значение false, оно удалит изображение из локального хранилища докера при операции уничтожения.
На практике подтвердилось

Lesson_2*
1) Создал ВМ через web интерфейс
   ![image](https://github.com/AntonStogov/netology_terraform/assets/97850376/182f19fb-38da-4439-ae24-6dbad37072b6)
2) ssh testad@158.160.118.186
выполнил подключение к виртуальной машине
testad@test1:~$ docker -v
Docker version 25.0.1, build 29cf629
установил docker





