Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Пароль пользователя postgres:
psql (14.7)
ПРЕДУПРЕЖДЕНИЕ: Кодовая страница консоли (866) отличается от основной
                страницы Windows (1251).
                8-битовые (русские) символы могут отображаться некорректно.
                Подробнее об этом смотрите документацию psql, раздел
                "Notes for Windows users".
Введите "help", чтобы получить справку.

postgres=# \! chcp 1251
Текущая кодовая страница: 1251
postgres=# \c skypro
Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro=# SELECT * FROM employee;
ОШИБКА:  отношение "employee" не существует

skypro=# CREATE TABLE employee(
    skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# first_name VARCHAR(50) NOT NULL,
        skypro(# last_name VARCHAR(50) NOT NULL,
        skypro(# gender VARCHAR(6) NOT NULL,
        skypro(# age INT NOT NULL
        skypro(# );
CREATE TABLE

    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES('Амир', 'Шакиров', 'м', 20);
    INSERT 0 1
    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES('Артемий', 'Наумов', 'м', 30);
    INSERT 0 1
    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES('Фёдор', 'Горшков', 'м', 40);
    INSERT 0 1
    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES('Алиса', 'Сорокина', 'ж', 50);
    INSERT 0 1
    skypro=#
    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES('Даниил', 'Пименов', 'м', 60);
    INSERT 0 1
    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES('Мария', 'Ерофеева', 'ж', 70);
    INSERT 0 1
    skypro=# SELECT * FROM employee;
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    1 | Амир       | Шакиров   | м      |  20
    2 | Артемий    | Наумов    | м      |  30
    3 | Фёдор      | Горшков   | м      |  40
    4 | Алиса      | Сорокина  | ж      |  50
    5 | Даниил     | Пименов   | м      |  60
    6 | Мария      | Ерофеева  | ж      |  70
(6 строк)


    skypro=# SELECT first_name AS Имя,
    skypro-# last_name AS Фамилия
    skypro-# FROOM employee;
    ОШИБКА:  ошибка синтаксиса (примерное положение: "FROOM")
    СТРОКА 3: FROOM employee;
    ^
    skypro=# SELECT first_name AS Имя,
    skypro-# last_name AS Фамилия
    skypro-# FROM employee;
    Имя   | Фамилия
---------+----------
    Амир    | Шакиров
    Артемий | Наумов
    Фёдор   | Горшков
    Алиса   | Сорокина
    Даниил  | Пименов
    Мария   | Ерофеева
(6 строк)


    skypro=# SELECT * FROM employee WHERE age < 30 OR age > 50;
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    1 | Амир       | Шакиров   | м      |  20
    5 | Даниил     | Пименов   | м      |  60
    6 | Мария      | Ерофеева  | ж      |  70
(3 строки)


    skypro=# SELECT * FROM employee WHERE age BETWEEN 30 AND 50;
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    2 | Артемий    | Наумов    | м      |  30
    3 | Фёдор      | Горшков   | м      |  40
    4 | Алиса      | Сорокина  | ж      |  50
(3 строки)


    skypro=# SELECT * FROM employee ORDER BY last_name DESC;
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    1 | Амир       | Шакиров   | м      |  20
    4 | Алиса      | Сорокина  | ж      |  50
    5 | Даниил     | Пименов   | м      |  60
    2 | Артемий    | Наумов    | м      |  30
    6 | Мария      | Ерофеева  | ж      |  70
    3 | Фёдор      | Горшков   | м      |  40
(6 строк)


    skypro=# SELECT * FROM employee WHERE first_name LIKE '____%';
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    1 | Амир       | Шакиров   | м      |  20
    2 | Артемий    | Наумов    | м      |  30
    3 | Фёдор      | Горшков   | м      |  40
    4 | Алиса      | Сорокина  | ж      |  50
    5 | Даниил     | Пименов   | м      |  60
    6 | Мария      | Ерофеева  | ж      |  70
(6 строк)


    skypro=# UPDATE employee SET first_name = 'Амир' WHERE id = 3;
    UPDATE 1
    skypro=# UPDATE employee SET first_name = 'Мария' WHERE id = 4;
    UPDATE 1
    skypro=# SELECT * FROM employee;
    id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
    1 | Амир       | Шакиров   | м      |  20
    2 | Артемий    | Наумов    | м      |  30
    5 | Даниил     | Пименов   | м      |  60
    6 | Мария      | Ерофеева  | ж      |  70
    3 | Амир       | Горшков   | м      |  40
    4 | Мария      | Сорокина  | ж      |  50
(6 строк)


    skypro=# SELECT first_name AS Имя,
    skypro-# SUM(age) AS Суммарный_возраст
    skypro-# FROM employee GROUP BY Имя;
    Имя   | Суммарный_возраст
---------+-------------------
    Артемий |                30
    Даниил  |                60
    Мария   |               120
    Амир    |                60
(4 строки)


    skypro=# SELECT first_name AS Имя,
    skypro-# MIN(age) AS Самый_юный_возраст
    skypro-# FROM employee GROUP BY Имя;
    Имя   | Самый_юный_возраст
---------+--------------------
    Артемий |                 30
    Даниил  |                 60
    Мария   |                 50
    Амир    |                 20
(4 строки)


    skypro=# SELECT first_name AS Имя,
    skypro-# MAX(age) AS Максимальный_возраст
    skypro-# FROM employee
    skypro-# GROUP BY Имя
    skypro-# HAVING count(first_name) > 1
    skypro-# ORDER BY Максимальный_возраст;
    Имя  | Максимальный_возраст
-------+----------------------
    Амир  |                   40
    Мария |                   70
(2 строки)