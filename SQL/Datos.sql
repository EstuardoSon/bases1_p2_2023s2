
insert into carrera(id, nombre) values (0, "Area Comun");
call crearCarrera("Sistemas");
call crearCarrera("Mecanica");
call crearCarrera("Civil");
call crearCarrera("Industrial");
call crearCarrera("Electrica");

-- call registrarDocente(nombres, appellidos, fecha_nac,correo, telefono, direccion,dpi, siif);
call registrarDocente('Javier', 'Espino', '11-10-1990','2984001050101@ingenieria.usac.com', 32095604, 'Mixco',2984001050101, 1);
call registrarDocente('Otto', 'Escobar', '11-2-1995','2984002050101@ingenieria.usac.com', 46424534, 'Chimaltenango',2984002050101, 2);
call registrarDocente('Mario', 'Estrada', '11-1-1992','2984003050101@ingenieria.usac.com', 44560669, 'Villa Nueva',2984003050101, 3);
call registrarDocente('Pedro', 'Hernandez', '11-6-1989','2984004050101@ingenieria.usac.com', 39650212, 'Petapa',2984004050101, 4);
call registrarDocente('Otto', 'Rodriguez', '11-6-1984','2984005050101@ingenieria.usac.com', 57469490, 'San Lucas',2984005050101, 5);

-- call registrarEstudiante(carnet, nombres, apellidos, fecha_nac, correo, telefono, direccion, dpi, carrera)
call registrarEstudiante(202003894, 'Estuardo', 'Son', '26-01-2002','2986622050101@ingenieria.usac.com', 49849095, 'Petapa', 2986622050101, 1);
call registrarEstudiante(202003895, 'Diego', 'Pacay', '30-12-2001','2986624050101@ingenieria.usac.com', 3456234, 'Colinas', 2986624050101, 1);
call registrarEstudiante(202003896, 'Jose', 'Perez', '28-12-2001','2986623050101@ingenieria.usac.com', 75434565, 'Villa Nueva', 2986623050101, 1);
call registrarEstudiante(202003897, 'Alvaro', 'Imeri', '13-7-2001','2986625050101@ingenieria.usac.com', 45631201, 'San Cristobal', 2986625050101, 1);
call registrarEstudiante(202003898, 'Ricardo', 'Cabrera', '12-3-2001','2986626050101@ingenieria.usac.com', 40002311, 'San Lucas', 2986626050101, 1);
call registrarEstudiante(202003899, 'Rodrigo', 'Martinez', '5-5-2001','2986627050101@ingenieria.usac.com', 44321265, 'Petapa', 2986627050101, 1);
call registrarEstudiante(202003900, 'Andres', 'Rodriguez', '2-6-2001','2986628050101@ingenieria.usac.com', 34565321, 'Petapa', 2986628050101, 2);
call registrarEstudiante(202003901, 'Sebastian', 'Murga', '6-6-2002','2986629050101@ingenieria.usac.com', 34546226, 'San Cristobal', 2986629050101, 3);
call registrarEstudiante(202003902, 'Edwin', 'Sam', '27-7-2001','2986630050101@ingenieria.usac.com', 90639488, 'Alamos', 2986630050101, 4);
call registrarEstudiante(202003903, 'Lennin', 'Moscoso', '21-09-2001','2986631050101@ingenieria.usac.com', 21344444, 'Ciudad Real', 2986631050101, 5);

-- call crearCurso(codigo,nombre,creditos_necesita,creditos_otorga,carrera,obligatorio);
-- Area Comun
call crearCurso(101, 'Matematica 1', 0, 9, 0, 1);
call crearCurso(17, 'Social Humanistica 1', 0, 3, 0, 1);
call crearCurso(39, 'Deportes 1', 0, 2, 0, 0);
call crearCurso(103, 'Matematica 2', 9, 9, 0, 1);
call crearCurso(19, 'Social Humanistica 2', 3, 3, 0, 1);

-- Sistemas
call crearCurso(795,'Logica de Sistemas', 12, 3, 1, 1);
call crearCurso(770,'IPC1', 12, 3, 1, 1);
call crearCurso(771,'IPC2', 15, 3, 1, 1);
call crearCurso(796,'LFP', 15, 3, 1, 1);
call crearCurso(777,'Compiladores 1', 18, 3, 1, 1);

-- Mecanica
call crearCurso(170,'Mecanica Analitica 1', 12, 4, 2, 1);
call crearCurso(250,'Mecanica de Fluidos', 16, 5, 2, 1);
call crearCurso(172,'Mecanica Analitica 2', 16, 5, 2, 1);
call crearCurso(200,'Electricidad y Electronica', 16, 6, 2, 0);
call crearCurso(202,'Hidraulica', 23, 5, 2, 1);

-- Civil
call crearCurso(30,'Geografia 1', 12, 4, 3, 0);
call crearCurso(28,'Ecologia', 12, 4, 3, 1);
call crearCurso(349,'Quimica para Civil', 12, 6, 3, 1);
call crearCurso(450,'Geologia', 16, 6, 3, 1);
call crearCurso(311,'Analisis Estructural', 16, 4, 3, 1);

-- Industrial
call crearCurso(617,'Diseño Industrial', 12, 6, 4, 1);
call crearCurso(452,'Ciencia de los Minerales', 12, 5, 4, 1);
call crearCurso(368,'Principios de Metrologia', 12, 5, 4, 0);
call crearCurso(653,'Ingenieria de Costos', 17, 4, 4, 1);
call crearCurso(520,'Procesos de Manufactura', 18, 5, 4, 1);

-- Electrica
call crearCurso(18,'Filosofia de la Ciencia', 12, 1, 5, 1);
call crearCurso(10,'Logica', 12, 1, 5, 1);
call crearCurso(204,'Circuitos Electronicos', 13, 7, 5, 1);
call crearCurso(210,'Teoria Electromagnetica 1', 13, 6, 5, 1);
call crearCurso(211,'Teoria Electromagnetica 2', 19, 5, 5, 0);