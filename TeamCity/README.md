# Домашнее задание к занятию 11 «Teamcity»

 1) Создайте новый проект в teamcity на основе fork.
   Ответ: Создал fork репозитория, авторизовал агента, так же создал новый проект на основе форк
   ![image](https://github.com/user-attachments/assets/dbe2c263-d9e7-4c4f-a220-06a51ab5c41b)
   ---
   ![image](https://github.com/user-attachments/assets/c766c2a7-aa28-4965-ac64-78ec2e9ff4ad)
   ---

 2) Сделайте autodetect конфигурации.
   Ответ: Сделал autodetect конфигурации
   ![image](https://github.com/user-attachments/assets/e61f7ff1-87d6-407a-a360-dbab7abfc7e9)
   ---

 3) Сохраните необходимые шаги, запустите первую сборку master.
   Ответ: Запустил первую сборку master
   https://github.com/AntonStogov/netology_terraform/blob/main/TeamCity/4.png?raw=true
   ---
   
 4) Поменяйте условия сборки: если сборка по ветке master, то должен происходит mvn clean deploy, иначе mvn clean test.
   Ответ: Изменил условия сборки
   https://github.com/AntonStogov/netology_terraform/blob/main/TeamCity/5.png?raw=true
   ---
   
 5) Для deploy будет необходимо загрузить settings.xml в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.
   Ответ: Загрузил settings.xml в набор конфигураций maven
   ![image](https://github.com/user-attachments/assets/54fd9521-ee2c-407d-9d46-22dcb03c7f19)
   ---

 6) В pom.xml необходимо поменять ссылки на репозиторий и nexus.
   Ответ: Исправил ссылки в pom.xml
   ---
   
 7) Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.
   Ответ: Запустил сборку артефакт появился в nexus
   ![image](https://github.com/user-attachments/assets/9cb3f9bc-e3ae-495c-9ade-555f6aa92ae2)
   ---
   ![image](https://github.com/user-attachments/assets/ad9f9234-b1ef-4d1b-976f-89de6e0f564f)
   ---

 8) Мигрируйте build configuration в репозиторий.
   Ответ: Мигрировал build configuration в репозиторий
   ![image](https://github.com/user-attachments/assets/d9c3d6b7-14ca-4f96-9b8d-07ea4872d3b4)
   ---

 9) Создайте отдельную ветку feature/add_reply в репозитории.
    Ответ: Создал ветку feature/add_reply
    ![image](https://github.com/user-attachments/assets/d77b0e32-a2fb-4acc-912b-cb323373da78)
    ---

 10) Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово hunter.
    Ответ: Новый метод
    public String replyHunter() {
	    return "Hello, hunter!";
    ---

 11) Дополните тест для нового метода на поиск слова hunter в новой реплике.
    Ответ: добавил тест
    @Test
	 public void testReplyHunter() {
    	 Welcomer welcomer = new Welcomer();
    	 assertTrue(welcomer.replyHunter().contains("hunter"));
    ---
    
 12) Сделайте push всех изменений в новую ветку репозитория.
    Ответ: Сделал пуш всех изменений
    ---
    
 13) Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.
    Ответ: Сборка запустилась, все работает хорошо
    ![image](https://github.com/user-attachments/assets/819d5f14-54a2-4fb6-85b3-76f2aafdd647)
    ---

 14) Внесите изменения из произвольной ветки feature/add_reply в master через Merge.
    Ответ: сделал
    git checkout master
    git merge feature/add_reply
    git pull origin master
    git push origin master
    ---
    
 15) Убедитесь, что нет собранного артефакта в сборке по ветке master.
    Ответ: Убедился, что нет собранного артефакта в сборке по ветке master
    ![image](https://github.com/user-attachments/assets/94a4f363-e4ac-4da9-9f02-b874ab0ae367)
    ---
    
 16) Настройте конфигурацию так, чтобы она собирала .jar в артефакты сборки.
    Ответ: в general settings, пункт Artifact paths, прописал target/*.jar => target, сохранил изменения.
    ---
    
 17) Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.
    Ответ: Артефакты собраны
    ![image](https://github.com/user-attachments/assets/2495b7a0-b202-4b8c-9509-0519291d5c21)

 18) Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.
    Ответ: Проверил
    ![image](https://github.com/user-attachments/assets/86e7f060-6214-40d4-9068-9e9df0427ebe)


