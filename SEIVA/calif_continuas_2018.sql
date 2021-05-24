SELECT ciclo, escuela, grupo, materia, matricula, apellido, nombre, ev_continua_des.mes, SUM(ev_continua) AS continua, examen, (SUM(ev_continua)+examen*0.5) AS Promedio
FROM (

	SELECT cc.id_inscripcion AS id_insc, c.nombre_ciclo AS ciclo, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, m.nombre_materia AS materia, a.id_alumno AS matricula, a.apellido AS apellido, a.nombre AS nombre, cc.mes AS num_mes, stp.nombre_mes AS mes, cp.nombre_calificacion AS concepto, (cp.porcentaje * MAX(cc.calificacion/100)) AS ev_continua, cex.calificacion AS examen
	FROM calificaciones_continua cc
		JOIN inscripcion_materia im ON cc.id_inscripcion = im.id_inscripcion
		JOIN materias m ON im.id_materia = m.id_materia
		JOIN alumnos a ON im.id_alumno = a.id_alumno
		JOIN grupos g ON m.id_grupo = g.id_grupo
		JOIN seivas s ON g.id_seiva = s.id_seiva
		JOIN escuelas e ON s.id_escuela = e.id_escuela
		JOIN ciclos c ON s.id_ciclo = c.id_ciclo
		JOIN calificaciones_porcentaje cp ON cc.consecutivo_calificacion = cp.consecutivo_calificacion AND m.id_materia = cp.id_materia AND cc.mes = cp.mes
		JOIN seivas_tipos_porcentajes stp ON s.tipo_seiva = stp.id_tipo_seiva AND cc.mes = stp.mes
		JOIN calificaciones_examen cex ON cc.id_inscripcion = cex.id_inscripcion AND cc.mes = cex.mes
		
		
	WHERE nombre_escuela = 'PREPARATORIA EDISON' AND a.id_alumno = 000521
	GROUP BY c.nombre_ciclo, e.nombre_escuela, g.nombre_grupo, m.nombre_materia, a.id_alumno, a.apellido, a.nombre, stp.nombre_mes, cp.nombre_calificacion) ev_continua_des	


GROUP BY ciclo, escuela, grupo, materia, matricula, apellido, nombre, mes	
