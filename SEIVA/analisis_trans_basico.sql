SELECT cue.id_pregunta_historial, preg.texto_pregunta AS pregunta, COUNT(cue.id_pregunta_historial) AS 'Conteo de Preguntas', SUM(cue.puntuacion) AS 'Respuestas Correctas', (SUM(cue.puntuacion)/COUNT(cue.id_pregunta_historial)*100) AS 'Porcentaje Respuestas Correctas'
FROM examenes e JOIN examenes_intentos inte ON e.id_examen = inte.id_examen
					 JOIN examenes_cuestionario cue ON inte.id_intento = cue.id_intento
					 JOIN banco_historial_preguntas preg ON cue.id_pregunta_historial = preg.id_pregunta_historial
WHERE e.id_examen = 22815 AND inte.aciertos > 0
GROUP BY cue.id_pregunta_historial, pregunta
ORDER BY (SUM(cue.puntuacion)/COUNT(cue.id_pregunta_historial)*100)