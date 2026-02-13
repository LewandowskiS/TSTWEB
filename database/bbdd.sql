DROP SCHEMA IF EXISTS baseDatos;
create database baseDatos collate utf8_spanish_ci;

use baseDatos;

Create table grupo
(id int  auto_increment,
codigo char(4) not null,
descripcion varchar(70) not null,
primary key (id));

create table estudiante
(id int auto_increment,
nombre varchar(40) not null,
apellido varchar(40) not null,
fecha_nacimiento date not null,
grp int default 1 not null,
nota float not null,
index(grp),
primary key (id),
foreign key(grp) references grupo(id) on update cascade);
 
INSERT INTO grupo (codigo,descripcion) VALUES ('SM3', 'Sistemas microinformáticos');
INSERT INTO grupo (codigo,descripcion) VALUES ('AS3', 'Administración de sistemas informáticos en red');
INSERT INTO grupo (codigo,descripcion) VALUES ('DW3', 'Desarrollo de aplicaciones web');
INSERT INTO grupo (codigo,descripcion) VALUES ('DM3', 'Desarrollo de aplicaciones multiplataforma');
INSERT INTO grupo (codigo,descripcion) VALUES ('IA3', 'Inteligencia artificial y big data');

             
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Alan","Turing","1912/03/23",1,1.3);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Ada","Lovelace","1815/12/10",2,2.4);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Bill","Gates","1955/10/28",3,3.5);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Steve","Jobs","1955/02/24",4,4.6);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Tim","Berners-Lee","1955/06/08",5,5.7);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Grace","Hopper","1906/12/09",1,6.8);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Dennis","Ritchie","1941/09/09",2,7.9);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Linus","Torvalds","1969/12/28",3,1.2);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Larry","Page","1973/03/26",4,2.3);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Sergey","Brin","1973/08/21",5,3.4);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("John","Von Neumann","1903/12/28",1,5.6);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Douglas","Engelbart","1925/01/30",2,4.5);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Charles","Babbage","1791/12/26",3,7.8);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Claude","Shannon","1916/04/30",4,1.2);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Konrad","Zuse","1910/06/22",5,1.5);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Donald","Knuth","1938/01/10",1,1.6);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Ken","Thompson","1943/02/04",2,1.3);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Vint","Cerf","1943/06/23",3,8.7);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Robert","Noyce","1927/12/12",4,4.5);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Gordon","Moore","1929/01/03",5,5.6);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("John","McCarthy","1927/09/04",1,7.8);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Edsger","Dijkstra","1930/05/11",2,6.5);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Alan","Kay","1940/05/17",3,8.7);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Ray","Tomlinson","1941/04/23",4,9.8);
INSERT INTO estudiante (nombre,apellido,fecha_nacimiento,grp,nota) VALUES ("Mark","Zuckerberg","1984/05/14",4,3.4);
             
