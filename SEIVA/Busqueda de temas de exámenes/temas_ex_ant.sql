USE seiva;
SELECT DISTINCT mu.unidad, mu.nombre_unidad, mt.tema, mt.id_tema, mt.nombre_tema, COUNT(bhp.id_pregunta_historial)
FROM examenes_preguntas ep JOIN banco_historial_preguntas bhp ON ep.id_pregunta_historial = bhp.id_pregunta_historial
									JOIN materias_temas mt ON bhp.id_tema = mt.id_tema
									JOIN materias_unidades mu on mt.id_unidad = mu.id_unidad
									
WHERE ep.id_examen IN (23133)
GROUP BY mu.unidad, mu.nombre_unidad, mt.tema, mt.nombre_tema
ORDER BY unidad, tema