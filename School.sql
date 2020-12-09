--
-- Файл сгенерирован с помощью SQLiteStudio v3.2.1 в Ср дек 9 13:01:56 2020
--
-- Использованная кодировка текста: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: class
CREATE TABLE class
(
  year_of_study INT NOT NULL,
  class_ID INT NOT NULL,
  number_of_students INT NOT NULL,
  letter INT NOT NULL,
  creation_year INT NOT NULL,
  type_ID INT NOT NULL,
  PRIMARY KEY (class_ID),
  FOREIGN KEY (type_ID) REFERENCES types_of_class(type_ID)
);

-- Таблица: item
CREATE TABLE item
(
  code_of_the_subject INT NOT NULL,
  name INT NOT NULL,
  description INT NOT NULL,
  emp_ID INT NOT NULL,
  FOREIGN KEY (emp_ID) REFERENCES staff(emp_ID)
);

-- Таблица: position
CREATE TABLE position
(
  pos_ID INT NOT NULL,
  name_positions INT NOT NULL,
  salary INT NOT NULL,
  duties INT NOT NULL,
  requirements INT NOT NULL,
  PRIMARY KEY (pos_ID)
);

-- Таблица: schedule
CREATE TABLE schedule
(
  date INT NOT NULL,
  weekday INT NOT NULL,
  code_of_the_subject INT NOT NULL,
  start_time INT NOT NULL,
  end_time INT NOT NULL,
  class_ID INT NOT NULL,
  FOREIGN KEY (class_ID) REFERENCES class(class_ID)
);

-- Таблица: staff
CREATE TABLE staff
(
  emp_ID INT NOT NULL,
  age INT NOT NULL,
  name INT NOT NULL,
  sex INT NOT NULL,
  addres INT NOT NULL,
  passport_data INT NOT NULL,
  phone INT NOT NULL,
  pos_ID INT NOT NULL,
  class_ID INT NOT NULL,
  PRIMARY KEY (emp_ID),
  FOREIGN KEY (pos_ID) REFERENCES position(pos_ID),
  FOREIGN KEY (class_ID) REFERENCES class(class_ID)
);

-- Таблица: student
CREATE TABLE student
(
  name INT NOT NULL,
  date_of_birth INT NOT NULL,
  sex INT NOT NULL,
  additional_information INT NOT NULL,
  name_mother INT NOT NULL,
  addres INT NOT NULL,
  name_father INT NOT NULL,
  class_ID INT NOT NULL,
  FOREIGN KEY (class_ID) REFERENCES class(class_ID)
);

-- Таблица: types_of_class
CREATE TABLE types_of_class
(
  type_ID INT NOT NULL,
  name INT NOT NULL,
  description INT NOT NULL,
  PRIMARY KEY (type_ID)
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
