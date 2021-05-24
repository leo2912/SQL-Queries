SELECT cue.id_pregunta_historial, preg.texto_pregunta AS pregunta, res.texto_respuesta AS respuesta, (CASE WHEN res.correcta = 1 THEN 'si' ELSE 'no' END) AS res_correcta, COUNT(cue.respuesta) AS 'Num_Seleciones'
FROM examenes e JOIN examenes_intentos inte ON e.id_examen = inte.id_examen
					 JOIN examenes_cuestionario cue ON inte.id_intento = cue.id_intento
					 JOIN banco_historial_preguntas preg ON cue.id_pregunta_historial = preg.id_pregunta_historial
					 JOIN banco_historial_respuestas res ON preg.id_pregunta_historial = res.id_pregunta_historial AND cue.respuesta = res.respuesta
					  
WHERE e.id_examen = 22429 AND inte.aciertos > 0 AND cue.id_pregunta_historial IN (149138, 149149)
GROUP BY cue.id_pregunta_historial, pregunta, respuesta