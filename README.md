# Plans and Theory Tests

## Theory Tests
---

[Databases Introduction. Data Definition and Datatypes.](https://forms.gle/5cx8VGsR2R2oX6Dt6)

---

[Basic CRUD](https://forms.gle/VHcF8oj5qLz7a9ec7)

---

[Built-in Functions](https://forms.gle/zUacHr5xNV8YNVme7)

---

[Data Aggregation](https://forms.gle/zDr5w2v5uDfTxT6v5)

---

[Table Relations](https://forms.gle/qYAZDquBNGSQmTYx9)

---

[Subqueries and Joins](https://forms.gle/iquiVSbKE2xd7QRTA)

---

[Data Programmability](https://forms.gle/bWeXZg21VBwMLyQ17)

---

## Plans

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

Бонус: Индекси - два вида

- Ползвaме ги, когато често търсим по едно поле
- Clustered - групиран по някакъв начин, често ползваме primary key-a
- Non-Clustered - индексираме по всяко поле, по което пожелаем имаме линкове към реалните данни
  
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
     
- Създава таблица с полетата от друга таблица, но без данните;   
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

BUILD IN FUNCTIONS

1. String, Math, Date And Time

2. String Functions
   - SUBSTRING(string, position, length: optional) - String from Position for Length, също може да бъде използван за това дали един стринг е събстринг на друг.
   - REPLACE(string, string to replace, to replace with) - case sensitive
   - LTRIM, RTRIM - маха празни разстояния от ляво и от дясно 
	    - нямаме полза да пазим празни места; 
	    - можем да изтриваме и определен символ;
      - ще изтриваме всеки символ докато не намерим различен от този, който търсим.
   - CHAR_LENGTH - STRING LENGTH;
   - LENGTH - Връща дължината на един стринг.
   - OCTET_LENGTH - Всеки символ от ascii таблицата е 1 байт, за останалите зависи от encoding-a => "café" => c - 1byte, a - 1byte, f - 1byte, é - 2 bytes;
   - LEFT, RIGHT, (string count)- вземат n на брой елементи, ляво и дясно; можем да подаваме отрицателни стойности и по този начин да взимаме всико без последните n елементи.
   - LOWER, UPPER, (string)
   - REVERSE, (string)
   - REPEAT, (string, count)
   - INSERT(String, Position, chars count to delete, sub string)
   - POSITION - ex. POSITION('b' IN some_field) - връща индекса, на който е намерило въпросната стойност.

3. Math Functions
   - DIV, целочислено деление
   - MOD, модулно деление
   - /, -, *, +
   - АBS
   - PI
   - SQRT (NUMBER)
   - POW (NUMBER, POWER) - степенуване
   - ROUND - UP >= 5 DOWN 4 <= - (NUMBER, PERCISION)
   - FLOOR, CEIL
   - SIGN(NUMBER) - връща знака като 1, -1 или 0
   - RANDOM() - връща число между 0 и 1
     - CEIL(rand() * 100) MOD 7; връща число между 0 и 6;

4. Date Functions
   - EXTRACT (PART FROM DATE) - PART - YEAR, MONTH, DAY, MINUTES...
   - AGE() - връща разликата между две дати
   - TO_CHAR() 
	- TO_CHAR(NOW() AT TIME ZONE 'UTC', 'YYYY-MM-DD HH24:MI:SS TZD');
	- Резултат '2023-09-20 12:34:56 UTC'

5. WILD_CARDS
   - LIKE() - подобно на регекс търси дали нещо започва/завършва или двете едновременно на някакъв string/pattern
	    - % означава 0 или повече символи преди/след string-a 
	    - _ е за попълване на точна позиция 
   - REGEXP

---

### Data Aggregation

<b>Агрегация - процес на обединение на различни елементи в една система.</b>

1. Grouping 
- Третираме еднакви записи като един 
- При GROUP BY, за разлика от distinct можем да ползваме агрегиращи функции
- COUNT(DISTINCT()) - ще даде броя на групите
- COUNT(*) - брой редовете

2. Aggregate functions
- AVG, MIN, MAX, COUNT, SUM

3. Having 

- Допълнителна филтрация, в която можем да използваме агрегиращи функции
- Извършва се след като данните са взети

4. CASE

- Simple Case
  - Използваме, когато сравняваме само една стойност

```sql
SELECT 
    column_name,
    CASE grade
        WHEN 'A' THEN 'Excellent'
        WHEN 'B' THEN 'Good'
        WHEN 'C' THEN 'Fair'
        ELSE 'Poor'
    END AS grade_description
FROM student_grades;
```


- General Case
  - Използваме, когато  сравняваме различни условия


```sql
SELECT 
    column_name,
    CASE 
        WHEN grade >= 90 THEN 'Excellent'
        WHEN grade >= 80 THEN 'Good'
        WHEN grade >= 70 THEN 'Fair'
	WHEN grade <= 0 THEN 'Mistake'
        ELSE 'Poor'
    END AS grade_description
FROM student_grades;
```

Edge cases to keep in mind:

* COUNT() - брои всико без Null
* where се изпълнява преди да се върнат данните, нещо като if, върху този резултат правим групиране и върху него чак тогава having
* where филтрира преди да се вземат данните, докато having е след като са взети

---

### Table Relations


1. Entites - Стъпки в DB Design
   
   1.1 Дефиниране на обекти
   	- Всяка таблица представлява обект

   1.2 Създаване на колони
   
   1.3 Дефиниране на PK
   	- ID-тата са INT или STRING 
	- По-сигурно е да са стрингове, защото по-трудно се разбиват с brute force
   	- Ако нещо е PK, то то вече е Unique
   	  
   1.4 Дефиниране на релации
        - Many To One
        - Many To Many - постигаме чрез junction/mapping table
        - One To One
   
   1.5 Дефиниране на ограничения - CONSTRAINTS
   
   1.6 Попълване с тестови данни

3. Cascade delete
   - Изтривайки един запис, свързан с други записи посредством релация, изтриваме всички записи.

   - Използваме, когато искаме да запазим консистентност на данните
   - Не го използваме, когато искаме да запазим някаква история или логове.


Good to keep in mind:

*Композитен ключ е ключ създаден от условие пример concat(f_name, l_name)

---

### Subqueries and Joins

1. Joins - better than selects with where in performance
   - Inner Join - Default join - join where both are not null, if one is null both are not visualized
   - Left Join - Join the left table if right is null
   - Right Join - Join the right if left is null
   - Full join (union) - join everything
   - Outer join (union) - less used
   - Cross Join - every element from one table with every element from the other - not used often

2. Subqueries
   - SELECT FROM SELECT
   - Example:
   ```sql
   
   SELECT first_name, last_name, department, salary
   FROM employees
   WHERE salary > (
      SELECT AVG(salary)
      FROM employees
      WHERE department = 'Finance'
   );

3. Indicies
   - Индексиране на таблица е създаване на структура върху нашата таблица, която гледа и анализира нашата таблица и прави един вид шорткът
   - Като голяма книга, с разделители и примерно, ако търсиш зебра отиваш на буквата З
   - Два вида индекси
	- Clustered - сортиране на стойностите с цел бинарно търсене
        - Non-clustered - B-Tree (Balanced Tree) - създава уникални node-ове и всеки node държи pointer към записите
   - Създавайки индекси по-бързо четем, но по-бавно update-ваме и трием записи, също така губим памет.

---

### Database Programmability

1. Functions
- Създаваме си наши фукции подобно на view-та
- Създаваме функцията
- Казваме какво връща като тип
- Функциите в postgres биват 3 типа
	- STABLE - това са фунцкиите, които при една и съща таблица връщат един и същ резултат, ф-ция за броя редове
	- IMMUTABLE - функцията винаги ще връща един и същи резултат, независима от таблици, пример квадрат на число
	- VOLATILE - това са функциите по-подразбиране, променливи
- Можем да достъпваме променливи чрез $цифра, но не е преопоръчително

2. Procedures
- повечето случаи void фунцкции
- execute by CALL 

3. Transactions
- Дейстивия, които извършваме върху базата и можем да върнем, ако пожелаем

```sql
-- Start a transaction
BEGIN;

-- Deduct $100 from Alice's account
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;

-- Add $100 to Bob's account
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;

-- Check Bob's new balance
DECLARE
    bob_balance DECIMAL(20,2);
BEGIN
    SELECT balance INTO bob_balance FROM accounts WHERE account_id = 2;
    IF bob_balance > 1000 THEN
        RAISE NOTICE 'Bob has too much money. Rolling back transaction.';
        ROLLBACK;
        RETURN;
    END IF;
END;
```

- Savepoint Example:

```sql
-- Start the transaction
BEGIN;

-- Add some amount
UPDATE accounts SET balance = balance + 50 WHERE id = 1;

-- Create a savepoint
SAVEPOINT my_savepoint;

-- Deduct some amount
UPDATE accounts SET balance = balance - 30 WHERE id = 1;

-- Decide for some reason to rollback to the savepoint
ROLLBACK TO SAVEPOINT my_savepoint;

END;
```

4. Trigger
- Functions executed Before/After a DELETE/UPDATE/INSERT query
- Example:

```sql
CREATE OR REPLACE FUNCTION update_last_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_modified = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_last_modified
BEFORE UPDATE ON products
FOR EACH ROW EXECUTE FUNCTION update_last_modified();
```

*plpgsql - Procedural Language/PostgreSQL
