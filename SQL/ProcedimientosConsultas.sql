DELIMITER //
create procedure consultarPensum(in carrera int)
begin
	set @idCarrera = null;
	select c.id from CARRERA c where c.id = carrera into @idCarrera;
    
    if @idCarrera is null then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existe una carrera con el id ingresado';
	end if;
    
	select c.codigo as "Codigo del Curso", c.nombre as "Nombre del Curso", if(c.obligatorio=1,"SI","NO") as "Es Obligatorio", c.creditos_necesarios as "Creditos Necesarios" from CURSO c where c.carrera = carrera or c.carrera = 0;
end //
DELIMITER ;

DELIMITER //
create procedure consultarEstudiante(in carnet bigint)
begin
	set @carnetE = null;
    
	select e.carnet from ESTUDIANTE e where e.carnet = carnet into @carnetE;
    
    if @carnetE is null then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existe un estudiante con el carnet ingresado';
	end if;
    
    select e.carnet as Carnet, concat(e.nombres," ",e.apellidos) as "Nombre Completo", 
    e.fecha_nac as "Fecha de Nacimiento", e.correo as Correo, e.telefono as Telefono, e.direccion as Direccion, e.dpi as DPI, e.carrera as "ID Carrera", c.nombre as "Carrera", e.creditos as "Creditos que Posee"
    from ESTUDIANTE e
    inner join CARRERA c on c.id = e.carrera
    where e.carnet = @carnetE;
end //
DELIMITER ;

DELIMITER //
create procedure consultarDocente(in siif bigint)
begin
	set @siifDocente = null;
    
	select d.siif from DOCENTE d where d.siif = siif into @siifDocente;
    
    if @siifDocente is null then
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existe un docente con el siif ingresado';
	end if;
    
    select d.siif as SIIF, concat(d.nombres," ",d.apellidos) as "Nombre Completo", 
    d.fecha_nac as "Fecha de Nacimiento", d.correo as Correo, d.telefono as Telefono, d.direccion as Direccion, d.dpi as DPI
    from DOCENTE d
    where d.siif = @siifDocente;
end //
DELIMITER ;

DELIMITER //
create procedure consultarAsignados(in curso int, in ciclo char(2), in anio int, in seccion char)
begin
	set @idCH = null;
    
    select cursoH.id from CURSO_HABILITADO cursoH
    where cursoH.curso = curso and cursoH.ciclo = ciclo and cursoH.seccion = seccion and cursoH.anio = anio into @idCH;
    
    if @idCH is null then   
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existe un curso con los datos ingresados';
    end if; 

	set @idCH = null;
    
    select count(e.carnet) from ESTUDIANTE e
    inner join ASIGNACION asignacion on asignacion.carnet = e.carnet
    inner join CURSO_HABILITADO cursoH on cursoH.id = asignacion.cursoH
    where cursoH.curso = curso and cursoH.ciclo = ciclo and cursoH.seccion = seccion and cursoH.anio = anio and asignacion.estado = 1 into @idCH;
    
    if @idCH = 0 then   
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'El curso no posee estudiantes asignados';
    end if; 

	select e.carnet as Carnet, concat(e.nombres, " ", e.apellidos) as "Nombre Completo", e.creditos as "Creditos que posee" from ESTUDIANTE e
    inner join ASIGNACION asignacion on asignacion.carnet = e.carnet
    inner join CURSO_HABILITADO cursoH on cursoH.id = asignacion.cursoH
    where cursoH.curso = curso and cursoH.ciclo = ciclo and cursoH.seccion = seccion and cursoH.anio = anio and asignacion.estado = 1;
end //
DELIMITER ;

DELIMITER //
create procedure consultarActas(in curso int)
begin
	set @idCH = 0;
    select count(cH.curso) from ACTA a
    inner join CURSO_HABILITADO cH on ch.id = a.cursoH
    where cH.curso = curso group by a.id into @idCH;
    
    if @idCH = 0 then   
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existen actas con el codigo de curso ingresado';
    end if; 

	select cH.curso as "Codigo de Curso", cH.seccion as "Seccion", 
    (CASE WHEN cH.ciclo = "1S" THEN "PRIMER SEMESTRE" 
    WHEN cH.ciclo = "VJ" THEN "VACACIONES DE JUNIO" 
    WHEN cH.ciclo = "2S" THEN "SEGUNDO SEMESTRE" 
    WHEN cH.ciclo = "VD" THEN "VACACIONES DE DICIEMBRE" END) as Ciclo,
    cH.anio as Año, cH.asignados as "Cantidad Asignados", a.fecha_hora as Fecha from ACTA a
    inner join CURSO_HABILITADO cH on ch.id = a.cursoH
    inner join ASIGNACION asi on asi.cursoH = cH.id
    inner join NOTA n on n.asignacion = asi.id
    where cH.curso = curso group by a.id;

end //
DELIMITER ;

DELIMITER //
create procedure consultarDesasignacion(in curso int, in ciclo char(2), in anio int, in seccion char)
begin
	set @idCH = null;
	select cH.id from CURSO_HABILITADO cH
    where cH.curso = curso and cH.ciclo = ciclo and cH.anio = anio and cH.seccion = seccion into @idCH;
    
    if @idCH is null then   
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No existe un curso con los parametros ingresados';
    end if; 
    
	select cH.curso as "Codigo de Curso", cH.seccion as "Seccion", 
    (CASE WHEN cH.ciclo = "1S" THEN "PRIMER SEMESTRE" 
    WHEN cH.ciclo = "VJ" THEN "VACACIONES DE JUNIO" 
    WHEN cH.ciclo = "2S" THEN "SEGUNDO SEMESTRE" 
    WHEN cH.ciclo = "VD" THEN "VACACIONES DE DICIEMBRE" END) as Ciclo,
    cH.anio as Año, cH.asignados as "Cantidad Asignados", sum(if(a.estado = 0,1,0)) as "Cantidad de Desasignados", 
    ((sum(if(a.estado = 0,1,0))/count(a.id)) * 100) as "Porcentaje Desasignacion" from ASIGNACION a
    inner join CURSO_HABILITADO cH on cH.id = a.cursoH
    inner join NOTA n on n.asignacion = a.id
    where cH.curso = curso and cH.ciclo = ciclo and cH.anio = anio and cH.seccion = seccion group by cH.id;
    
end //
DELIMITER ;