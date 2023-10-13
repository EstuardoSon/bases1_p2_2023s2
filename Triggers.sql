use BASES1PRACTICA2;

-- CREACION DE TRIGGERS
-- ////////////////////////////TRIGGERS AL INSERTAR
DELIMITER //
create trigger insertarCarrera after insert on CARRERA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en CARRERA", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarDocente after insert on DOCENTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en DOCENTE", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarEstudiante after insert on ESTUDIANTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en ESTUDIANTE", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarNota after insert on NOTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en NOTA", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarCurso after insert on CURSO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en CURSO", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarAsignacion after insert on ASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en ASIGNACION", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarDesasignacion after insert on DESASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en DESASIGNACION", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarCursoH after insert on CURSO_HABILITADO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en CURSO_HABILITADO", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarActa after insert on ACTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en ACTA", "INSERT");
end //
DELIMITER ;

DELIMITER //
create trigger insertarHorario after insert on HORARIO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en HORARIO", "INSERT");
end //
DELIMITER ;







-- ////////////////////////////////TRIGGERS AL ELIMINAR
DELIMITER //
create trigger eliminarCarrera after delete on CARRERA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en CARRERA", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarDocente after delete on DOCENTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se inserto un registro en DOCENTE", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarEstudiante after delete on ESTUDIANTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en ESTUDIANTE", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarNota after delete on NOTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en NOTA", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarCurso after delete on CURSO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en CURSO", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarAsignacion after delete on ASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en ASIGNACION", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarDesasignacion after delete on DESASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en DESASIGNACION", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarCursoH after delete on CURSO_HABILITADO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en CURSO_HABILITADO", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarActa after delete on ACTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en ACTA", "DELETE");
end //
DELIMITER ;

DELIMITER //
create trigger eliminarHorario after delete on HORARIO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se elimino un registro en HORARIO", "DELETE");
end //
DELIMITER ;







-- TRIGGERS AL MODIFICAR
DELIMITER //
create trigger modificarCarrera after update on CARRERA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en CARRERA", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarDocente after update on DOCENTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en DOCENTE", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarEstudiante after update on ESTUDIANTE for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en ESTUDIANTE", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarNota after update on NOTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en NOTA", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarCurso after update on CURSO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en CURSO", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarAsignacion after update on ASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en ASIGNACION", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarDesasignacion after update on DESASIGNACION for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en DESASIGNACION", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarCursoH after update on CURSO_HABILITADO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en CURSO_HABILITADO", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarActa after update on ACTA for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en ACTA", "UPDATE");
end //
DELIMITER ;

DELIMITER //
create trigger modificarHorario after update on HORARIO for each row
begin
	insert into HISTORIAL(fecha, descripcion, tipo) values (now(), "Se modifico un registro en HORARIO", "UPDATE");
end //
DELIMITER ;
