-- /////////////// Cargas Adicionales

-- call habilitarCurso(curso,ciclo,docente,cupo,seccion);
call habilitarCurso(101,'1s',1,4,'a');
call habilitarCurso(17,'1s',2,4,'a');
call habilitarCurso(103,'vj',1,4,'b');

-- call agregarHorario(cursoH,dia,horario);
call agregarHorario(1,1,'9:00-10:40');
call agregarHorario(2,5,'7:00-9:00');
call agregarHorario(3,4,'15:00-17:00');

-- call asignarCurso(curso,ciclo,seccion,carnet);
call asignarCurso(101,'1s','a',202003894);
call asignarCurso(101,'1s','a',202003895);
call asignarCurso(101,'1s','a',202003896);
call asignarCurso(101,'1s','a',202003897);

-- call desasignarCurso(curso,ciclo,seccion,carnet);
call desasignarCurso(101,'1s','a',202003894);
call desasignarCurso(101,'1s','a',202003895);
call desasignarCurso(101,'1s','a',202003896);
call desasignarCurso(101,'1s','a',202003897);

-- ///////////////// Asignar otros
call asignarCurso(101,'1s','a',202003899);
call asignarCurso(101,'1s','a',202003900);
call asignarCurso(101,'1s','a',202003901);
call asignarCurso(101,'1s','a',202003902);
call desasignarCurso(101,'1s','a',202003902);

-- call ingresarNota(curso,ciclo,seccion,carnet,nota);

-- call generarActa(curso,ciclo,seccion);

-- /////////////// Consultas
-- call consultarPensum(carrera);
call consultarPensum(1);
call consultarPensum(2);
call consultarPensum(3);
call consultarPensum(4);
call consultarPensum(5);

-- call consultarEstudiante(carnet);
call consultarEstudiante(202003894);

--  call consultarDocente(siif);
call consultarDocente(1);

-- call consultarAsignados(curso,ciclo,año,seccion);
call consultarAsignados(101,'1s',2023,'a');

-- call consultarAprobacion(curso,ciclo,año,seccion);
call consultarAprobacion(101,'1s',2023,'a');

-- call consultarActas(curso);
call consultarActas(101);

-- call consultarDesasignacion(curso,ciclo,año,seccion);
call consultarDesasignacion(101,'1s',2023,'a');