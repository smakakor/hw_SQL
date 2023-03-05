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

postgres-# \c skypro
Вы подключены к базе данных "skypro" как пользователь "postgres".
skypro-# \! chcp 1251
Текущая кодовая страница: 1251

    // задание 1

skypro=# CREATE TABLE city (
    skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# city_name VARCHAR(50)
        skypro(# );
CREATE TABLE
    skypro=# ALTER TABLE employee ADD COLUMN city_id INT;
ALTER TABLE
    skypro=# INSERT INTO city (city_name) VALUES ('Ижевск');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Москва');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Санкт-Петербург');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Казань');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Тюмень');
INSERT 0 1
skypro=# SELECT * FROM city;
city_id |    city_name
---------+-----------------
       1 | Ижевск
       2 | Москва
       3 | Санкт-Петербург
       4 | Казань
       5 | Тюмень
(5 строк)


skypro=# INSERT INTO city (city_name) VALUES ('Иркутск');
INSERT 0 1
skypro=# ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city (city_id);
ALTER TABLE
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Амир       | Шакиров   | м      |  20 |
  2 | Артемий    | Наумов    | м      |  30 |
  5 | Даниил     | Пименов   | м      |  60 |
  6 | Мария      | Ерофеева  | ж      |  70 |
  3 | Амир       | Горшков   | м      |  40 |
  4 | Мария      | Сорокина  | ж      |  50 |
(6 строк)


skypro=# UPDATE employee SET city_id = 1 WHERE id = 1;
UPDATE 1
    skypro=# UPDATE employee SET city_id = 1 WHERE id = 6;
UPDATE 1
    skypro=# UPDATE employee SET city_id = 2 WHERE id = 5;
UPDATE 1
    skypro=# UPDATE employee SET city_id = 3 WHERE id = 4;
UPDATE 1
    skypro=# UPDATE employee SET city_id = 4 WHERE id = 3;
UPDATE 1
    skypro=# UPDATE employee SET city_id = 6 WHERE id = 2;
UPDATE 1
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Амир       | Шакиров   | м      |  20 |       1
  6 | Мария      | Ерофеева  | ж      |  70 |       1
  5 | Даниил     | Пименов   | м      |  60 |       2
  4 | Мария      | Сорокина  | ж      |  50 |       3
  3 | Амир       | Горшков   | м      |  40 |       4
  2 | Артемий    | Наумов    | м      |  30 |       6
(6 строк)

   // задание 2

skypro=# SELECT employee.first_name, employee.last_name, city.city_name
    skypro-# FROM employee
                      skypro-# JOIN city
skypro-# ON employee.city_id = city.city_id;
first_name | last_name |    city_name
------------+-----------+-----------------
 Амир       | Шакиров   | Ижевск
 Мария      | Ерофеева  | Ижевск
 Даниил     | Пименов   | Москва
 Мария      | Сорокина  | Санкт-Петербург
 Амир       | Горшков   | Казань
 Артемий    | Наумов    | Иркутск
(6 строк)


skypro=# SELECT city.city_name, employee.first_name, employee.last_name
    skypro-# FROM employee RIGHT JOIN city
    skypro-# ON employee.city_id = city.city_id;
city_name    | first_name | last_name
-----------------+------------+-----------
 Ижевск          | Амир       | Шакиров
 Ижевск          | Мария      | Ерофеева
 Москва          | Даниил     | Пименов
 Санкт-Петербург | Мария      | Сорокина
 Казань          | Амир       | Горшков
 Иркутск         | Артемий    | Наумов
 Тюмень          |            |
(7 строк)


skypro=# SELECT employee.first_name, city.city_name
    skypro-# FROM employee FULL OUTER JOIN city
    skypro-# ON employee.city_id = city.city_id;
first_name |    city_name
------------+-----------------
 Амир       | Ижевск
 Мария      | Ижевск
 Даниил     | Москва
 Мария      | Санкт-Петербург
 Амир       | Казань
 Артемий    | Иркутск
            | Тюмень
(7 строк)


skypro=# SELECT employee.first_name, city.city_name
    skypro-# FROM employee CROSS JOIN city;
first_name |    city_name
------------+-----------------
 Амир       | Ижевск
 Мария      | Ижевск
 Даниил     | Ижевск
 Мария      | Ижевск
 Амир       | Ижевск
 Артемий    | Ижевск
 Амир       | Москва
 Мария      | Москва
 Даниил     | Москва
 Мария      | Москва
 Амир       | Москва
 Артемий    | Москва
 Амир       | Санкт-Петербург
 Мария      | Санкт-Петербург
 Даниил     | Санкт-Петербург
 Мария      | Санкт-Петербург
 Амир       | Санкт-Петербург
 Артемий    | Санкт-Петербург
 Амир       | Казань
 Мария      | Казань
 Даниил     | Казань
 Мария      | Казань
 Амир       | Казань
 Артемий    | Казань
 Амир       | Тюмень
 Мария      | Тюмень
 Даниил     | Тюмень
 Мария      | Тюмень
 Амир       | Тюмень
 Артемий    | Тюмень
 Амир       | Иркутск
 Мария      | Иркутск
 Даниил     | Иркутск
 Мария      | Иркутск
 Амир       | Иркутск
 Артемий    | Иркутск
(36 строк)


skypro=#