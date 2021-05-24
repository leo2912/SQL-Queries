SELECT preg.id_pregunta_historial, preg.texto_pregunta, res.texto_respuesta, (CASE WHEN res.correcta = 1 THEN 'si' ELSE 'no' END) AS res_correcta, COUNT(ec.respuesta) AS 'num_respuestas'
FROM examenes e JOIN examenes_preguntas ep on e.id_examen = ep.id_examen
					 JOIN banco_historial_preguntas preg ON ep.id_pregunta_historial = preg.id_pregunta_historial
					 JOIN banco_historial_respuestas res ON preg.id_pregunta_historial = res.id_pregunta_historial
					 JOIN examenes_intentos inte ON ep.id_examen = inte.id_examen
					 LEFT JOIN examenes_cuestionario ec ON ep.id_pregunta_historial = ec.id_pregunta_historial AND inte.id_intento = ec.id_intento AND res.respuesta = ec.respuesta
					 
WHERE e.id_examen = 22429 AND inte.aciertos > 0 AND preg.id_pregunta_historial IN ()
GROUP BY preg.id_pregunta_historial, preg.texto_pregunta, res.texto_respuesta, res_correcta				  