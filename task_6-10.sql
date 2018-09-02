---------------------------------------------------------------------------
-- Created on 31.08.2018
-- @author: Ivan Semernyakov <beatuminflow@gmail.com>
---------------------------------------------------------------------------

CREATE TABLE DEPARTMENT
(
    id integer PRIMARY KEY NOT NULL,
    name varchar(200)
);

INSERT INTO DEPARTMENT (name) VALUES ('1', 'Департамент 1');
INSERT INTO DEPARTMENT (name) VALUES ('2', 'Департамент 2');
INSERT INTO DEPARTMENT (name) VALUES ('3', 'Департамент 3');
INSERT INTO DEPARTMENT (name) VALUES ('4', 'Департамент 3');
INSERT INTO DEPARTMENT (name) VALUES ('5', 'Департамент 5');
INSERT INTO DEPARTMENT (name) VALUES ('6', 'Департамент 6');
INSERT INTO DEPARTMENT (name) VALUES ('7', 'Департамент 7');

CREATE TABLE EMPLOEYEE
(
    id integer PRIMARY KEY NOT NULL,
    name varchar(200) NOT NULL,
    department_id integer,
    salary integer,
    chief_id integer,
    FOREIGN KEY (chief_id) REFERENCES EMPLOEYEE (id),
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT (id)
);

INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('1', 'Пётр', 1, 300, 1);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('2', 'Вася', 2, 400, 2);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('3', 'Фёдор', 3, 500, 3);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('4', 'Петрович', 1, 600, 1);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('5', 'Семён', 7, 350, 3);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('6', 'Игнат', 4, 400, 6);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('7', 'Маша', 2, 380, 2);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('8', 'Света', 6, 400, 3);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('9', 'Юля', 7, 400, 4);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('10', 'Трофим', 6, 500, 5);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('11', 'Ульяна', 5, 400, 6);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('12', 'Соня', 3, 100, 8);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('13', 'Серёжа', 3, 400, 8);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('14', 'Афоня', 5, 300, 5);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('15', 'Миша', 3, 200, 6);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('16', 'Афанасий', 2, 350, 2);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('17', 'Жора', 3, 460, 3);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('18', 'Тимофей', 1, 620, 2);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('19', 'Сёма', 5, 460, 3);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('20', 'Алекс', 7, 600, 3);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('21', 'Юля', 7, 400, 6);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('22', 'Марфа', 5, 300, 8);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('23', 'Софа', 4, 200, 7);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('24', 'Уля', 3, 100, 8);
INSERT INTO EMPLOEYEE (name, department_id, salary, chief_id) VALUES ('25', 'Зоя', 1, 500, 2);

-- Задание 1
-- сотрудники з/п которых больше чем у руководителя

SELECT
chief.name AS ChiefName,
chief.salary AS ChiefSalary,
EMPLOEYEE.name AS PersonName,
EMPLOEYEE.salary AS PersonSalary
FROM EMPLOEYEE chief INNER JOIN EMPLOEYEE
ON chief.chief_id = EMPLOEYEE.id
AND EMPLOEYEE.salary > chief.salary
ORDER BY chief.salary DESC, EMPLOEYEE.name;

-- Задание 2
-- сотрудники с максимальной з/п по отделу

SELECT name AS PersonName,
department_id AS DepartmentID,
MAX(salary) AS PersonMaxSalary
FROM EMPLOEYEE GROUP BY department_id
ORDER BY department_id ASC;

-- Задание 3
-- ID отделов в которых менее 3 сотрудников

SELECT DEPARTMENT.id AS DepartmentID
FROM EMPLOEYEE, DEPARTMENT
WHERE department_id = DEPARTMENT.id
GROUP BY DEPARTMENT.id
  HAVING count(department_id) < 3
ORDER BY DEPARTMENT.id;

-- Задание 4
-- сотрудники не имеющиe руководителя работающего в одном и том же отделе

SELECT person.name AS PersonName
FROM EMPLOEYEE person
JOIN DEPARTMENT dep ON person.department_id = dep.id
JOIN EMPLOEYEE chief ON person.chief_id = chief.id
JOIN DEPARTMENT dep2 ON chief.department_id = dep2.id
WHERE dep.id <> dep2.id
ORDER BY person.name;

-- Задание 5
-- список ID отделов с максимальной сумарной з/п сотрудников

SELECT
dep.name AS Department,
SUM(person.salary) AS Salary
FROM DEPARTMENT dep JOIN EMPLOEYEE person
ON dep.id = person.department_id GROUP BY dep.name
ORDER BY person.salary;


