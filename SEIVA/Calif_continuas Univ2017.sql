#CREATE TABLE cal_led_esc_2017

SELECT cic.nombre_ciclo AS ciclo, s.nombre_seiva AS seiva, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, m.nombre_materia AS materia, im.id_alumno AS matricula, al.apellido AS apellido, al.nombre AS nombre, 
    stp.nombre_mes AS mes, ccon.consecutivo_calificacion, ccon.calificacion AS calificacion
	FROM calificaciones_continua ccon JOIN inscripcion_materia im on ccon.id_inscripcion = im.id_inscripcion
					  JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
                      JOIN seivas_tipos_porcentajes stp ON ccon.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
                      JOIN alumnos al ON im.id_alumno = al.id_alumno
                      
                      
	WHERE m.tipo_materia = 'A' AND cic.nombre_ciclo = '2017 - 2018' AND s.nombre_seiva = 'SEPTIEMBRE - DICIEMBRE 2017' AND e.nombre_escuela = 'Licenciatura En Derecho Escolarizado Iva' AND m.nombre_materia = 'Obligaciones'
	#GROUP BY ciclo, seiva, escuela, grupo, materia, matricula, apellido, nombre, mes, porcentaje



#HAVING tpond = 100
