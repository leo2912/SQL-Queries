SELECT cals.ciclo, cals.seiva, cals.escuela, cals.grupo, cals.materia, cals.matricula, cals.calificacion as cal_mensual

FROM (


	SELECT cic.nombre_ciclo AS ciclo, s.nombre_seiva AS seiva, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, m.nombre_materia AS materia, im.id_alumno AS matricula, 
    stp.nombre_mes AS mes, c.calificacion AS calificacion
	FROM calificaciones c JOIN inscripcion_materia im on c.id_inscripcion = im.id_inscripcion
					  JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
                      JOIN seivas_tipos_porcentajes stp ON c.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
                      
	WHERE m.tipo_materia = 'A' AND stp.nombre_mes = "FINAL"
) cals


WHERE cals.escuela="INGENIERÍA EN AGRONEGOCIOS" AND cals.materia="COMPETITIVDAD 4" AND cals.ciclo= "2016 - 2017"
GROUP BY cals.ciclo, cals.seiva, cals.escuela, cals.grupo, cals.materia, cals.matricula
#HAVING tpond = 100
