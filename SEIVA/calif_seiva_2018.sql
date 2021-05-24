SELECT cic.nombre_ciclo AS ciclo, s.nombre_seiva AS seiva, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, m.nombre_materia AS materia, im.id_alumno AS matricula, al.apellido AS apellido, al.nombre AS nombre, 
    stp.nombre_mes AS mes, stp.porcentaje AS porcentaje, MAX(c.calificacion) AS calificacion
	FROM cal_2018 c JOIN inscripcion_materia im on c.id_inscripcion = im.id_inscripcion
					  JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
                      JOIN seivas_tipos_porcentajes stp ON c.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
                      JOIN alumnos al ON im.id_alumno = al.id_alumno
                      
	#WHERE m.tipo_materia = 'A' AND cic.nombre_ciclo = '2018 - 2019' AND s.nombre_seiva = 'SEPTIEMBRE - DICIEMBRE 2018' AND e.nombre_escuela = 'Licenciatura En Derecho Escolarizado Iva'
	WHERE m.tipo_materia = 'A' AND (e.nombre_escuela NOT LIKE '%KINDER%'
										AND e.nombre_escuela NOT LIKE '%PRIMARIA%'
										AND e.nombre_escuela NOT LIKE '%SECUNDARIA%'
										AND e.nombre_escuela NOT LIKE '%EDISON%')
	GROUP BY ciclo, seiva, escuela, grupo, materia, matricula, apellido, nombre, mes, porcentaje



#HAVING tpond = 100
