
insert into carrera(id, nombre) values (0, "Area Comun");
call crearCarrera("Ing Sistemas");
call crearCarrera("Psicologia");

call registrarEstudiante(202003894, 'Estuardo Gabriel', 'Son Mux', '2002-01-26','sonmux.estuardo@gmail.com', 49849095, 'San Miguel Petapa', 2986622050101, 1);
call registrarEstudiante(202003895, 'Laura', 'Minera', '2001-09-28','lau@gmail.com', 76474647, 'San Cristobal', 2986623050101, 1);
call registrarEstudiante(202003896, 'Digo', 'Pacay', '2001-12-30','digoPacay@gmail.com', 3456234, 'Colinas', 2986624050101, 2);

call registrarDocente('Javier', 'Espino', '1990-10-11','espino@gmail.com', 46424534, 'Mixco',34524213, 5635463);

call crearCurso(1, 'Matematica', 0, 5, 0, 1);
call crearCurso(11, 'Bases de datos', 5, 1, 1, 1);

call habilitarCurso(1,'vj',5635463,90,'a');
call habilitarCurso(11,'vj',5635463,90,'b');
call habilitarCurso(1,'2s',5635463,90,'a');

call agregarHorario(1, 1,'9:00-10:40');

call asignarCurso(1,'vj','a',202003894);
call asignarCurso(1,'vj','a',202003895);

-- call asignarCurso(1,'vj','b',202003896);

-- call desasignarCurso(1,'vj','a',202003895);
-- call desasignarCurso(11,'2s','b',202003894);

call ingresarNota(1,'vj','a',202003894,60.51);

call generarActa(1, 'vj', 'a');