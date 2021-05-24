CREATE TABLE cal_fin_alumno

SELECT cals.ciclo, cals.seiva, cals.escuela, cals.grupo, cals.materia, cals.matricula, SUM(porcentaje) AS tpond, SUM(cals.ponderado) as cal_final

FROM (


	SELECT cic.nombre_ciclo AS ciclo, s.nombre_seiva AS seiva, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, m.nombre_materia AS materia, im.id_alumno AS matricula, 
    stp.nombre_mes AS mes, stp.porcentaje AS porcentaje, c.calificacion AS calificacion, (c.calificacion*stp.porcentaje/100) AS ponderado
	FROM calificaciones c JOIN inscripcion_materia im on c.id_inscripcion = im.id_inscripcion
					  JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
                      JOIN seivas_tipos_porcentajes stp ON c.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
                      
	WHERE porcentaje < 100 AND m.tipo_materia = 'A'
) cals

GROUP BY cals.ciclo, cals.seiva, cals.escuela, cals.grupo, cals.materia, cals.matricula
WHERE cals.ciclo = 10, cals.seiva = 'SEPTIEMBRE - DICIEMBRE 2017', cals.escuela = 'Licenciatura En Derecho Escolarizado Iva'
#HAVING tpond = 100
