drop database if exists BASES1PRACTICA2;
create database BASES1PRACTICA2;
use BASES1PRACTICA2;
SET SESSION sql_mode='NO_AUTO_VALUE_ON_ZERO';

-- CREACION DE ENTIDIDADES 

create table HISTORIAL(
id int primary key auto_increment,
fecha datetime,
descripcion varchar(100),
tipo varchar(10)
);

create table CARRERA(
id int primary key auto_increment,
nombre varchar(50) not null
);

create table DOCENTE(
siif bigint primary key,
dpi bigint unique not null,
nombres varchar(50) not null,
apellidos varchar(50) not null,
fecha_nac date not null,
correo varchar(50) not null,
telefono int not null,
direccion varchar(50) not null
);

create table ESTUDIANTE(
carnet bigint primary key not null,
nombres varchar(50) not null,
apellidos varchar(50) not null,
fecha_nac date not null,
correo varchar(50) not null,
telefono int not null,
direccion varchar(50) not null,
dpi bigint unique not null,
carrera int not null,
fecha_creacion date not null,
creditos int not null,
foreign key (carrera) references CARRERA(id)
);

create table CURSO(
codigo int primary key,
nombre varchar(50) not null,
creditos_necesarios int not null,
creditos_otorga int not null,
obligatorio boolean not null,
carrera int not null,
foreign key (carrera) references CARRERA(id)
);

create table CURSO_HABILITADO(
id int primary key auto_increment,
ciclo char(2) not null, 
cupo_max int not null,
seccion char not null,
docente bigint not null,
curso int not null,
anio int default (year(curdate())),
asignados int default 0,
foreign key (docente) references DOCENTE(siif),
foreign key (curso) references CURSO(codigo)
);

create table ASIGNACION(
id int primary key auto_increment,
carnet bigint not null,
cursoH int not null,
foreign key (carnet) references ESTUDIANTE(carnet),
foreign key (cursoH) references CURSO_HABILITADO(id)
);

create table DESASIGNACION(
id int primary key auto_increment,
carnet bigint not null,
cursoH int not null,
foreign key (carnet) references ESTUDIANTE(carnet),
foreign key (cursoH) references CURSO_HABILITADO(id)
);

create table ACTA(
id int primary key auto_increment,
ciclo char(2),
seccion char,
fecha_hora datetime,
curso int,
foreign key (curso) references CURSO(codigo)
);

create table HORARIO(
id int primary key auto_increment,
dia int not null,
horario varchar(15) not null,
curso_habilitado int not null,
foreign key (curso_habilitado) references CURSO_HABILITADO(id)
);

create table NOTA(
id int primary key auto_increment,
ciclo char(2) not null,
seccion char not null,
nota float(2) not null,
carnet bigint not null,
curso int not null,
foreign key (carnet) references ESTUDIANTE(carnet),
foreign key (curso) references CURSO(codigo)
);

-- select * from HISTORIAL;
-- select * from CARRERA;
-- select * from DOCENTE;
-- select * from ESTUDIANTE;
-- select * from CURSO;
-- select * from ASIGNACION;
-- select * from DESASIGNACION;
-- select * from CURSO_HABILITADO;
-- select * from ACTA;
-- select * from HORARIO;
-- select * from NOTA;

