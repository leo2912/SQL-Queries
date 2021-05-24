SELECT bhp.id_pregunta_historial, bhp.texto_pregunta
FROM examenes_preguntas epr JOIN examenes ex ON epr.id_examen = ex.id_examen
									 JOIN banco_historial_preguntas bhp ON epr.id_pregunta_historial = bhp.id_pregunta_historial
WHERE ex.id_examen = 24726 and bhp.texto_pregunta LIKE ('%térmica%')