use BASES1PRACTICA2;

-- CREACION DE TRIGGERS
-- ////////////////////////////TRIGGERS AL INSERTAR
DELIMITER //
create trigger insertarCarrera after insert on CARRERA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en CARRERA", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarDocente after insert on DOCENTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en DOCENTE", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarEstudiante after insert on ESTUDIANTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en ESTUDIANTE", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarNota after insert on NOTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en NOTA", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarCurso after insert on CURSO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en CURSO", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarAsignacion after insert on ASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en ASIGNACION", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarDesasignacion after insert on DESASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en DESASIGNACION", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarCursoH after insert on CURSO_HABILITADO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en CURSO_HABILITADO", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarActa after insert on ACTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en ACTA", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarHorario after insert on HORARIO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en HORARIO", "INSERTAR");
end //
DELIMITER ;






-- ////////////////////////////////TRIGGERS AL ELIMINAR
DELIMITER //
create trigger eliminarCarrera after delete on CARRERA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en CARRERA", "ELIMINAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarDocente after delete on DOCENTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en DOCENTE", "ELIMINAR");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarEstudiante after delete on ESTUDIANTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en ESTUDIANTE", "ELIMINAR");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarNota after delete on NOTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en NOTA", "ELIMINAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarCurso after insert on CURSO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en CURSO", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarAsignacion after insert on ASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en ASIGNACION", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarDesasignacion after insert on DESASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en DESASIGNACION", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarCursoH after insert on CURSO_HABILITADO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en CURSO_HABILITADO", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarActa after insert on ACTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en ACTA", "INSERTAR");
end //
DELIMITER ;

DELIMITER //
create trigger insertarHorario after insert on HORARIO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en HORARIO", "INSERTAR");
end //
DELIMITER ;

-- TRIGGERS AL MODIFICAR