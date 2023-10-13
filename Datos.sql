
insert into carrera(id, nombre) values (0, "Area Comun");
call crearCarrera("Ing Sistemas");

call registrarEstudiante(202003894, 'Estuardo Gabriel', 'Son Mux', '2002-01-26','sonmux.estuardo@gmail.com', 49849095, 'San Miguel Petapa', 2986622050101, 1);

call registrarDocente('Estuardo Gabriel', 'Son Mux', '2002-01-26','sonmux.estuardo@gmail.com', 49849095, 'San Miguel Petapa',34524213, 5635463);

call crearCurso(11, 'Bases de datos', 0, 1, 1, 0);

call habilitarCurso(11,'vj',5635463,90,'a');

call asignarCurso(11,'vj','a',202003894);