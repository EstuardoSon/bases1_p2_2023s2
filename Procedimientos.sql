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
create procedure asignarCurso(in curso int, in ciclo char(2), in seccion char, carnet bigint)
begin
    select cursoH.id, cursoH.cupo_max, cursoH.curso, cursoH.asignados, curso.nombre, curso.creditos_necesarios, curso.carrera from CURSO_HABILITADO cursoH
    inner join CURSO curso on curso.codigo = cursoH.curso
    where cursoH.anio = year(curdate()) and cursoH.curso = curso and cursoH.seccion = upper(seccion) and cursoH.ciclo = upper(ciclo)
    into @cursoH, @cupo_max, @codigo, @asignados, @nombre, @creditos_necesarios, @carrera;
    
    select estudiante.carrera, estudiante.creditos from ESTUDIANTE estudiante
    where estudiante.carnet = carnet
    into @carreraE, @creditos;
    
    select asignacion.id from ASIGNACION asignacion
    inner join CURSO_HABILITADO cursoH on asignacion.cursoH = asignacion.cursoH
    where asignacion.carnet = carnet and cursoH.anio = year(curdate()) and cursoH.curso = curso and cursoH.ciclo = upper(ciclo)
    limit 1
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

