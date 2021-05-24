SELECT cic.nombre_ciclo, s.nombre_seiva, e.nombre_escuela, g.nombre_grupo, m.nombre_materia, im.id_alumno, stp.nombre_mes, stp.porcentaje, c.calificacion, (c.calificacion*stp.porcentaje/100) AS ponderado
FROM calificaciones c JOIN inscripcion_materia im on c.id_inscripcion = im.id_inscripcion
					  JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
                      JOIN seivas_tipos_porcentajes stp ON c.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
                      
WHERE porcentaje < 100 AND m.tipo_materia = 'A' AND im.id_alumno = 130012

                      
;                      
                      
SELECT COUNT(*)
FROM calificaciones c JOIN inscripcion_materia im on c.id_inscripcion = im.id_inscripcion
					  JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
                      JOIN seivas_tipos_porcentajes stp ON c.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
WHERE porcentaje < 100 AND m.tipo_materia = 'A'
;

