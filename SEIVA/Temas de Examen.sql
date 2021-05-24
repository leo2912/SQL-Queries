#SELECT p.*, h.id_tema, t.nombre_tema
SELECT distinct t.nombre_tema
FROM seiva.examenes_preguntas p JOIN banco_historial_preguntas h ON p.id_pregunta_historial = h.id_pregunta_historial
								JOIN materias_temas t ON h.id_tema = t.id_tema
where id_examen = 17738