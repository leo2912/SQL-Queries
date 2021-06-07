USE seiva;
#CREATE TABLE 'Ortiz_Mena'

SELECT cic.nombre_ciclo AS ciclo, s.nombre_seiva AS seiva, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, m.nombre_materia AS materia, stp.nombre_mes,
		im.id_alumno AS matricula, al.apellido AS apellido, al.nombre AS nombre,  ROUND(MAX(c.calificacion),2) as 'Calificación', c.`MAX(c.fecha_actualizacion)` AS fecha 
	FROM calif_r c JOIN inscripcion_materia im on c.id_inscripcion = im.id_inscripcion
					  JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
                      JOIN alumnos al ON im.id_alumno = al.id_alumno
                      JOIN seivas_tipos st ON s.tipo_seiva = st.id_tipo_seiva
                      JOIN seivas_tipos_porcentajes stp ON c.mes = stp.mes
                      
                      
	WHERE m.tipo_materia = 'A'  AND al.id_alumno IN (154723) AND stp.id_tipo_seiva = 'P'#  AND cic.id_ciclo = 8
	#WHERE m.tipo_materia = 'A'  AND e.id_escuela IN (10,30,50,53,56,59,62,66,69,73,76,69,82,85,89,92,100,104,107,110,114,123) AND stp.id_tipo_seiva = 'S' AND cic.id_ciclo = 8 AND (nombre_grupo LIKE ('1 %') OR nombre_grupo LIKE ('2 %') OR nombre_grupo LIKE ('3 %'))
	GROUP BY ciclo, seiva, escuela, grupo, materia, stp.mes, matricula, apellido, nombre
	ORDER BY matricula, grupo, materia
	
#stp.porcentaje AS porcentaje,
#HAVING tpond = 100
#stp.nombre_mes AS mes