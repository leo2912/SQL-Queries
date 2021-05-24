SELECT s.nombre_seiva, g.nombre_grupo, m.nombre_materia, e.id_examen, e.mes, bp.texto_pregunta, br.texto_respuesta, SUM(c.puntuacion) AS correctas, 
		COUNT(c.id_pregunta_historial) AS total, (100*SUM(c.puntuacion)/COUNT(c.id_pregunta_historial)) AS porcentaje_facilidad
FROM seivas s JOIN grupos g ON s.id_seiva = g.id_seiva
				JOIN materias m ON g.id_grupo = m.id_grupo
				JOIN examenes e ON m.id_materia = e.id_materia
                JOIN examenes_intentos i ON e.id_examen = i.id_examen
                JOIN examenes_cuestionario c ON i.id_intento = c.id_intento
                JOIN banco_historial_preguntas bp ON c.id_pregunta_historial = bp.id_pregunta_historial
                JOIN banco_historial_respuestas br ON bp.id_pregunta_historial = br.id_pregunta_historial
#WHERE s.nombre_seiva = 'AGOSTO - DICIEMBRE 2016' AND nombre_materia LIKE 'Geograf%'	AND e.mes = 
WHERE e.id_examen = 17365 AND i.aciertos > 0 AND br.correcta = 1
GROUP BY s.nombre_seiva, g.nombre_grupo, m.nombre_materia, e.id_examen, e.mes, c.id_pregunta_historial
ORDER BY porcentaje_facilidad DESC