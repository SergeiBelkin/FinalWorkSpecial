create database if not exists Animals;
use Animals;

create table CLASSAnimal(
	ID_CLASS_Animals INT PRIMARY KEY auto_increment,
    CLASSAnimalNAME VARCHAR(45)    
);
INSERT CLASSAnimal (CLASSAnimalNAME) 
VALUES("Домашние животные"),
("Вьючные животные");

create table if not exists HomeAnimals(
	id_class_HomeAnim INT PRIMARY KEY auto_increment,
    id_class INT,
    Animal VARCHAR(45),
    foreign key (id_class) references CLASSAnimal (ID_CLASS_Animals) ON DELETE CASCADE
);

INSERT HomeAnimals (id_class, Animal)
VALUES 
(1, "собаки"),
(1, "кошки"),
(1, "хомяки");


create table PackAnimals(
	id_class_PackAnim INT PRIMARY KEY auto_increment,
    id_class INT,
    Animal VARCHAR(45),
    foreign key (id_class) references CLASSAnimal (ID_CLASS_Animals) ON DELETE CASCADE
);

INSERT PackAnimals (id_class, Animal)
VALUES 
(2, "лошади"),
(2, "верблюды"),
(2, "ослы");

-- id_Animals = 1
CREATE TABLE dogs(
id INT PRIMARY KEY auto_increment,
id_Animals INT,
nam varchar(25), 
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references HomeAnimals (id_class_HomeAnim) ON DELETE CASCADE
);
INSERT dogs (id_Animals, nam, comands, birthday)
values
(1, "ам", "фу", "2013-12-04"),
(1, "кусь", "фас", "2019-12-04"),
(1, "ля", "бу", "1991-10-02");


-- id_Animals = 2
CREATE TABLE cats(
id INT PRIMARY KEY auto_increment,
id_Animals INT,
nam varchar(25),
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references HomeAnimals (id_class_HomeAnim) ON DELETE CASCADE
);
INSERT cats (id_Animals, nam, comands, birthday)
values
(2, "кот", "брысь", "2013-11-08"),
(2, "кыс", "кышь", "2022-12-02"),
(2, "шум", "иди", "2013-10-01");

-- id_Animals = 3
CREATE TABLE IF NOT EXISTS hamsters(
id INT PRIMARY KEY auto_increment,
id_Animals INT,
nam varchar(25),
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references HomeAnimals (id_class_HomeAnim) ON DELETE CASCADE
);
INSERT hamsters (id_Animals, nam, comands, birthday)
values
(3, "он", "ешь", "2023-03-19"),
(3, "она", "пей", "2022-04-13"),
(3, "бок", "ляг", "2021-09-23");

-- id_Animals = 1
CREATE TABLE IF NOT EXISTS horses(
id INT PRIMARY KEY auto_increment,
id_Animals INT,
nam varchar(25),
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references PackAnimals (id_class_PackAnim) ON DELETE CASCADE
);
INSERT horses (id_Animals, nam, comands, birthday)
values
(1, "жуй", "джамп", "2020-07-25"),
(1, "пей", "ком", "2012-03-15"),
(1, "скок", "ляг", "2016-01-20");

-- id_Animals = 2
CREATE TABLE IF NOT EXISTS camels(
id INT PRIMARY KEY auto_increment,
id_Animals INT,
nam varchar(25),
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references PackAnimals (id_class_PackAnim) ON DELETE CASCADE
);
INSERT camels (id_Animals, nam, comands, birthday)
values
(2, "кам", "го", "2015-04-30"),
(2, "бам", "го", "2011-04-06"),
(2, "лам", "но", "2009-02-04");

-- id_Animals = 3
CREATE TABLE IF NOT EXISTS donkeys(
id INT PRIMARY KEY auto_increment,
id_Animals INT,
nam varchar(25),
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references PackAnimals (id_class_PackAnim) ON DELETE CASCADE
);

INSERT donkeys (id_Animals, nam, comands, birthday)
values
(3, "сел", "вперед", "2021-12-02"),
(3, "мел", "вперед", "2020-10-05"),
(3, "вел", "вперед", "2014-04-18");

DROP TABLE camels;

SELECT id_Animals, nam, comands, birthday
FROM horses
UNION SELECT  id_Animals, nam, comands, birthday
FROM donkeys;


CREATE TABLE New_Animals as 
SELECT * from dogs
union SELECT * from cats
union SELECT * from hamsters
union SELECT * from horses
union SELECT * from donkeys;

drop table YoungAnimals;
CREATE TABLE YoungAnimals AS
SELECT *, timestampdiff(month, birthday, CURDATE())  as BirthMontH FROM New_Animals
WHERE datediff(CURDATE(), birthday) between 365 and 1095;
select * from YoungAnimals;