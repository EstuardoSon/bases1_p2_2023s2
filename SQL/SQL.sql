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
estado bool not null default 1,
foreign key (carnet) references ESTUDIANTE(carnet),
foreign key (cursoH) references CURSO_HABILITADO(id)
);

create table ACTA(
id int primary key auto_increment,
cursoH int,
fecha_hora datetime default (current_timestamp()),
foreign key (cursoH) references CURSO_HABILITADO(id)
);

create table HORARIO(
id int primary key auto_increment,
dia int not null,
hora_inicio time not null,
hora_fin time not null,
curso_habilitado int not null,
foreign key (curso_habilitado) references CURSO_HABILITADO(id),
unique (hora_inicio, hora_fin, curso_habilitado)
);

create table NOTA(
id int primary key auto_increment,
nota float(2) not null,
asignacion int,
foreign key (asignacion) references ASIGNACION(id)
);

-- select * from HISTORIAL;
-- select * from CARRERA;
-- select * from DOCENTE;
-- select * from ESTUDIANTE;
-- select * from CURSO;
-- select * from ASIGNACION;
-- select * from CURSO_HABILITADO;
-- select * from ACTA;
-- select * from HORARIO;
-- select * from NOTA;

