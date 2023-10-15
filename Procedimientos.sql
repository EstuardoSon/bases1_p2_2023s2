DELIMITER //
create procedure crearCarrera(nombre varchar(50))
begin
	if nombre REGEXP '^[a-zA-Z ]+$' then 
    insert into CARRERA(nombre) values (nombre);
	else
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El nombre debe contener solo letras';
	end if;
end //
DELIMITER ;

DELIMITER //
create procedure registrarEstudiante(in carnet bigint, in nombres varchar(50), in apellidos varchar(50), in fechas_nac date, in correo varchar(50), in telefono int, in direccion varchar(50), in dpi bigint, in carrera int)
begin
	if correo regexp '^[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}$' then 
		insert into ESTUDIANTE values (carnet, nombres, apellidos, fecha_nac, correo, telefono, direccion, dpi, carrera, curdate(), 0);
    else
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El correo no contiene un formato valido';
    end if;
end //
DELIMITER ;

DELIMITER //
create procedure registrarDocente(in nombres varchar(50), in apellidos varchar(50), in fechas_nac date, in correo varchar(50), in telefono int, in direccion varchar(50), in dpi bigint, in siif bigint)
begin
	if correo regexp '^[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}$' then 
		insert into DOCENTE values (siif, dpi, nombres, apellidos, fecha_nac, correo, telefono, direccion);
    else
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El correo no contiene un formato valido';
    end if;
end //
DELIMITER ;

DELIMITER //
create procedure crearCurso(in codigo int, in nombre varchar(50), in creditos_necesarios int, in creditos_otorga int, in carrera int, in obligatorio bool)
begin
	if creditos_necesarios < 0 then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Los creditos necesarios deben corresponder a 0 o un entero positivo';
    end if;
    
    if creditos_otorga <= 0 then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Los creditos que otroga deben corresponder a un entero positivo positivo mayor a 0';
    end if;
    
    insert into CURSO values(codigo, nombre, creditos_necesarios, creditos_otorga, obligatorio, carrera);
end //
DELIMITER ;

DELIMITER //
create procedure habilitarCurso(in curso int, in ciclo varchar(50), in docente bigint, in cupo_max int, in seccion char)
begin
	if upper(ciclo) regexp '^(1S|2S|VJ|VD)$'  then 
		insert into CURSO_HABILITADO(ciclo, cupo_max, seccion, docente, curso) values (upper(ciclo), cupo_max, upper(seccion), docente, curso);
    else
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El ciclo debe ser uno de los siguientes: 1S, 2S, VJ o VD';
    end if;
end //
DELIMITER ;

DELIMITER //
create procedure agregarHorario(in cursoH int, in dia int, in horario varchar(15))
begin
	set @idCursoH = null;

	if dia > 7 or dia < 1  then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El dia debe corresponder a un entero entre 1 y 7';
    end if;
    
    select id from CURSO_HABILITADO where id = cursoH into @idCursoH;
    
    if @idCursoH is null  then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existe un curso habilitado dicho ID';
    end if;
    
    insert into HORARIO(dia, horario, curso_habilitado) values (dia, horario, cursoH);
end //
DELIMITER ;

DELIMITER //
create procedure asignarCurso(in curso int, in ciclo char(2), in seccion char, carnet bigint)
begin
    set @cursoH = null, @cupo_max = null, @codigo = null, @asignados = null, @nombre = null, @creditos_necesarios = null, @carrera = null, @carreraE = null, @creditos = null, @asignacion = null;

    select cursoH.id, cursoH.cupo_max, cursoH.curso, cursoH.asignados, curso.nombre, curso.creditos_necesarios, curso.carrera from CURSO_HABILITADO cursoH
    inner join CURSO curso on curso.codigo = cursoH.curso
    where cursoH.anio = year(curdate()) and cursoH.curso = curso and cursoH.seccion = upper(seccion) and cursoH.ciclo = upper(ciclo)
    into @cursoH, @cupo_max, @codigo, @asignados, @nombre, @creditos_necesarios, @carrera;
    
    select estudiante.carrera, estudiante.creditos from ESTUDIANTE estudiante
    where estudiante.carnet = carnet
    into @carreraE, @creditos;
    
    select asignacion.id from ASIGNACION asignacion
    inner join CURSO_HABILITADO cursoH on cursoH.id = asignacion.cursoH
    where asignacion.carnet = carnet and cursoH.anio = year(curdate()) and cursoH.curso = curso and cursoH.ciclo = upper(ciclo)
    into @asignacion;
    
    if @cursoH is null then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existe un curso habilitado con los datos ingresados';
    end if;
    
    if @carreraE is null then 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existe un estudiante con dicho carnet';
    end if;
    
    if @carreraE <=> @carrera and @carrera <=> 0 then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No se puede asignar a un curso que no es de su carrera o area comun';
    end if;
    
    if @creditos_necesarios > @creditos then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No cuenta con los creditos necesarios para asignarse al curso';
    end if;
    
    if @cupo_max = @asignados then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'La seccion se encuentra llena';
    end if;

    if @asignacion is not null then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Ya se encuentra asignado a una seccion de este curso este ciclo';
    end if;
    
    insert into ASIGNACION(carnet, cursoH) values (carnet, @cursoH);
    update CURSO_HABILITADO cursoH set cursoH.asignados = (@asignados + 1) where cursoH.id = @cursoH;
end //
DELIMITER ;

DELIMITER //
create procedure desasignarCurso(in curso int, in ciclo char(2), in seccion char, carnet bigint)
begin
    set @cursoH = null, @asignados = null, @asignacion = null, @desasignacion = null;
    
    select asignacion.id from ASIGNACION asignacion
    inner join CURSO_HABILITADO cursoH on cursoH.id = asignacion.cursoH
    where asignacion.carnet = carnet and cursoH.anio = year(curdate()) and cursoH.curso = curso and cursoH.ciclo = upper(ciclo) and cursoH.seccion = upper(seccion)
    into @asignacion;
    
    if @asignacion is null then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No se encuentra ninguna asignacion con los parametros ingresados';
    end if;
    
    select desasignacion.id from DESASIGNACION desasignacion
    inner join CURSO_HABILITADO cursoH on cursoH.id = desasignacion.cursoH
    where desasignacion.carnet = carnet and cursoH.anio = year(curdate()) and cursoH.curso = curso and cursoH.ciclo = upper(ciclo)
    into @desasignacion;
    
    if @desasignacion is not null then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Ya se encuentra desasignado del curso';
    end if;
    
    select cursoH.id, cursoH.asignados from CURSO_HABILITADO cursoH
    where cursoH.anio = year(curdate()) and cursoH.curso = curso and cursoH.seccion = upper(seccion) and cursoH.ciclo = upper(ciclo)
    into @cursoH, @asignados;
    
    insert into DESASIGNACION(carnet, cursoH) values (carnet, @cursoH);
end //
DELIMITER ;

DELIMITER //
create procedure ingresarNota(in curso int, in ciclo char(2), in seccion char, carnet bigint, in nota float(2))
begin
    set @idCursoH = null, @creditos = null, @idNota = null;
    
    select asignacion.cursoH, c.creditos_otorga from ASIGNACION asignacion
    inner join CURSO_HABILITADO cursoH on cursoH.id = asignacion.cursoH
    inner join CURSO c on c.codigo = cursoH.curso
    where cursoH.curso = curso and cursoH.ciclo = ciclo and cursoH.seccion = seccion and cursoH.anio = year(curdate()) and asignacion.carnet = carnet
    into @idCursoH, @creditos;
    
    if @idCursoH is null then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No se encuentra una asignacion con los datos ingresados';
    end if;
    
    select nota.id from NOTA nota where nota.carnet = carnet and nota.cursoH = @idCursoH into @idNota;
    
    if @idNota is null then
		insert into NOTA(nota, carnet, cursoH) values (round(nota), carnet, @idCursoH);
	else
		update NOTA n set n.nota = round(nota) where n.id = @idNota;
    end if;
    
    if round(nota) >= 61 then
		update ESTUDIANTE e set e.creditos = (e.creditos + @creditos) where e.carnet = carnet;
    end if;
end //
DELIMITER ;

DELIMITER //
create procedure generarActa(in curso int, in ciclo char(2), in seccion char)
begin
	set @idCursoH = null, @contNota = 0;

    select c.id from CURSO_HABILITADO c where c.curso = curso and c.ciclo = ciclo and c.seccion = seccion and c.anio = year(curdate()) into @idCursoH;
    
    if @idCursoH is null then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No se encuentra ningun curso con los parametros ingresados';
    end if;
    
    select sum(if(n.nota is null, 1, 0)) from ESTUDIANTE e
    inner join ASIGNACION a on a.carnet = e.carnet
    left join NOTA n on n.carnet = e.carnet and n.cursoH = a.cursoH
    left join DESASIGNACION d on d.carnet = e.carnet and d.cursoH = a.cursoH
    where a.cursoH = @idCursoH and d.id is null into @contNota;
    
    if @contNota > 0 then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No se ha ingresado la nota de todos los estudiantes';
    end if;
    
    insert into ACTA(cursoH) values (@idCursoH);
end //
DELIMITER ;
