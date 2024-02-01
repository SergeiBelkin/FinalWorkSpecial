create database if not exists Animals;
use Animals;
create table if not exists CLASSAnimal(
	ID_CLASS_Animals INT PRIMARY KEY auto_increment,
    CLASSAnimalNAME VARCHAR(45)    
);
INSERT CLASSAnimal (CLASSAnimalNAME) 
VALUES("Домашние животные"),
("Вьючные животные");

create table if not exists HomeAnimals(
	id_class_HomeAnim INT PRIMARY KEY auto_increment,
    id_class INT default 1,
    Animal VARCHAR(45),
    foreign key (id_class) references CLASSAnimal (ID_CLASS_Animal) ON DELETE CASCADE
);

INSERT HomeAnimals ( Animal)
VALUES 
("собаки"),
("кошки"),
("хомяки");

create table if not exists PackAnimals(
	id_class_PackAnim INT PRIMARY KEY auto_increment,
    id_class INT default 2,
    Animal VARCHAR(45),
    foreign key (id_class) references CLASSAnimal (ID_CLASS_Animal) ON DELETE CASCADE
);

INSERT HomeAnimals ( Animal)
VALUES 
("лошади"),
("верблюды"),
("ослы");

CREATE TABLE IF NOT EXISTS dogs(
id INT PRIMARY KEY auto_increment,
id_Animals INT default 1,
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references HomeAnimals (id_class_HomeAnim) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS cats(
id INT PRIMARY KEY auto_increment,
id_Animals INT default 2,
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references HomeAnimals (id_class_HomeAnim) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS hamsters(
id INT PRIMARY KEY auto_increment,
id_Animals INT default 3,
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references HomeAnimals (id_class_HomeAnim) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS horses(
id INT PRIMARY KEY auto_increment,
id_Animals INT default 1,
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references PackAnimals (id_class_PackAnim) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS camels(
id INT PRIMARY KEY auto_increment,
id_Animals INT default 2,
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references PackAnimals (id_class_PackAnim) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS donkeys(
id INT PRIMARY KEY auto_increment,
id_Animals INT default 3,
comands VARCHAR (100),
birthday DATE,
foreign key (id_Animals) references PackAnimals (id_class_PackAnim) ON DELETE CASCADE
);

