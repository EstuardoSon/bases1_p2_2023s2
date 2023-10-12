drop database if exists BASES1PRACTICA2;
create database BASES1PRACTICA2;
use BASES1PRACTICA2;

-- CREACION DE ENTIDIDADES 

create table HISTORIAL(
id int primary key auto_increment,
fecha datetime,
descripcion varchar(100),
tipo varchar(10)
);

create table CARRERA(
id int primary key auto_increment,
nombre varchar(50)
);

create table DOCENTE(
siif int primary key,
dpi int unique,
nombres varchar(50),
apellidos varchar(50),
fecha_nac date,
correo varchar(50),
telefono int,
direccion varchar(50)
);

create table ESTUDIANTE(
carnet int primary key,
nombres varchar(50),
apellidos varchar(50),
fecha_nac date,
correo varchar(50),
telefono int,
direccion varchar(50),
dpi int unique,
carrera int,
foreign key (carrera) references CARRERA(id)
);

create table CURSO(
codigo int primary key,
nombre varchar(50),
creditos_necesarios int,
creditos_otorga int,
obligatorio boolean,
carrera int,
foreign key (carrera) references CARRERA(id)
);


create table ASIGNACION(
id int,
ciclo char(2),
seccion char,
carnet int,
curso int,
foreign key (carnet) references ESTUDIANTE(carnet),
foreign key (curso) references CURSO(codigo)
);

create table DESASIGNACION(
id int,
ciclo char(2),
seccion char,
carnet int,
curso int,
foreign key (carnet) references ESTUDIANTE(carnet),
foreign key (curso) references CURSO(codigo)
);

create table CURSO_HABILITADO(
id int primary key auto_increment,
cupo_max int,
seccion char,
docente int,
curso int,
foreign key (docente) references DOCENTE(siif),
foreign key (curso) references CURSO(codigo)
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
dia int,
horario varchar(15),
curso_habilitado int,
foreign key (curso_habilitado) references CURSO_HABILITADO(id)
);

insert into CARRERA(id) values (12.2);

select * from HISTORIAL;
select * from CARRERA;
select * from DOCENTE;
select * from ESTUDIANTE;
select * from CURSO;
select * from ASIGNACION;
select * from DESASIGNACION;
select * from CURSO_HABILITADO;
select * from ACTA;
select * from HORARIO;


-- insert into ASIGNACION values (1,'aa','a',12,12);