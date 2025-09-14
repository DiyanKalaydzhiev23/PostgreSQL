# Plans and Theory Tests

## Theory Tests

---

[Databases Introduction. Data Definition and Datatypes](https://forms.gle/5cx8VGsR2R2oX6Dt6)

---

[Basic CRUD](https://forms.gle/VHcF8oj5qLz7a9ec7)

---


### Databases Introduction. Data Definition and Datatypes.

`Едно е само да съхраняваме данни, друго е вече да ги менижираме`

1. Проблема с flat storage (файлове)

- Размер
- Сложност на ъпдейтване
- Точност
- Кой има достъп 

2. Какво е DBMS

- DataBase Management System 
- Система оптимизирана за търсене и обработване на данни
- Нямаме директен достъп до файловете, DBMS се грижи за товa
- Ние пускаме заявка към engine-a, еngine-a обработва заявката взима от файовете и връща на нас.
- Работим по TCP/IP протокола, но върху локалната машина;
- RDBMS - данните и engine-a; Relational Database Management System;

3. SQL/NoSQL
- Ползваме SQL, когато скалираме вертикално(upgrade на машината)
- Ползваме NoSQL, когато скалираме хоризонатлно(нова машина)

`Идеята на SQL синтаксиса е да е като изречение`

3. Части на една заявка
- Заявки - ALTER TABLE, ALTER COLUMNN, SELECT...
- Клаузи - update/delete и тн
- Изрази - salary * 1.1
- Предикати - job_title = "Cashier"
- Стейтмънти - Update Set Where, целия израз

4. Логически разделен на 4 категории

- Data Definition - описваме какви са нашите данни, как изглеждат данните, как са обвързани, как ще изглежда нашата схема
- Data Manipulation - READ/CREATE/UPDATE/DELETE
- Data Control - контрол върху правата или кой има достъп до данните
- Transaction Control - дали да пуснем заявките като група, тоест изпълняват се всички или нито една.

5. Защо ни трябват релации

- Получваме абстракция, гъвкавост и не повтаряме информация
- Нямаме празни записи (има случаи, в които е окей да имаме празни записи. Пример за презиме, защото човек има само едно такова и не е задължително)

6. Ключове

- Primary - винаги уникални
- Foreign

7. Entity/Relation диаграма

- можем да виждаме схемите и връзките между таблиците

8. Типове данни

- INT - small/int/big
- DECIMAL/NUMERIC - можем да кажем, до кой символ след десетичната запетая да фиксираме
- REAL - пази по-малка точност от double
- DOUBLE

- SERIAL - Създава скрипт, които да инкрементира числото на всеки нов запис, оставя вратата отворена за това ние ръчно да подадем стойност;
- GENERATED ALWAYS AS IDENTITY - Създава скрипт, които инкрементира числото, без да ни позволява да въведем стойност ръчно

- CHAR (255 symbols)
- VARCHAR (65 535 symbols)
- TEXT (65 535 symbols)
- BLOB

- DATE - дата без време - YYYY-MM-DD
- TIME - време без дата
- TIMESTAMP - дата и час
- TIMESTAMPZ - дата, час и часова зона

 
---

### CRUD - Create, Read, Update, Delete

1. Извличаме данни със SELECT - READ
- Moжем да филтрираме с WHERE
- SELECT * FROM project WHERE start_date='2023-06-01';
- ORDER BY - сортира данните
  - SELECT * FROM project ORDER BY id
  - ORDER BY first_name DESC, last_name ASC;
- SELECT id as 'No.' ...;
- SELECT e.id FROM employees as e;
- CONCAT() ex. SELECT CONCAT(first_name, ' ', second_name) as full_name ...;
- CONCAT_WS(); конкатенира пропускайки NULL стойностите
- SELECT DISTINCT елиминира дублиращи се резултати
- WHERE; WHERE id NOT IN ...; WHERE id = 1 OR/AND ...; WHERE id IN (1, 2, 3);
- NULL != 0 != '';
- WHERE id IS NULL; грешно е да пишем WHERE id = NULL;
- LIMIT 3; лимитираме бройката редове, които се получават;
- OFFSET 3 LIMIT 1; прескача първите 3 реда и взима следващия 1;
-
     `CREATE TABLE customer_contancts AS
         SELECT
            customer_id,
              first_name
         FROM customers;`

- Създава таблица с полетата от друга таблица и с данните;
- BETWEEN 1 AND 3 - ползва <= >=;

1.1 Проекция - какви колони искамe да вземем

1.2 Селекция - когато взимам някакви редове - често постигаме чрез WHERE

1.3 Join - комбиниране на колони

</br>

2.Обновяваме данни с UPDATE
- Искаме да update-ваме с условие в 99% от случаите
  `UPDATE projects
     SET end_date = '2006-02-02'
     WHERE start_date = '2005-01-01';`

2.2 INSERT
- NOW() - дава текущото време;
   `INSERT INTO projects(name, start_date)
     SELECT
         CONCAT(name, ' ', last_name),
         NOW()
     FROM departments;`

3.Изтриване на данни с DELETE
- `DELETE FROM projects WHERE start_date = '2006-01-01';`

4.Views - запазваме заявки за селектиране
- `CREATE VIEW v_hr_result_set AS
     SELECT
         CONCAT(fisrt_name, ' ', last_name) AS 'full name',
         salary
     FROM employees ORDER BY department_id;`

- `SELECT * FROM v_hr_result_set` - за да ползваме view-то
- Aко искаме да променим или update-нем view казваме `ALTER VIEW`

---
