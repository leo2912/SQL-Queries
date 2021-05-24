SELECT bp.id_pregunta, e.nombre_escuela, m.nombre_materia_iva, mu.unidad, mu.nombre_unidad, mt.tema, mt.nombre_tema, bp.texto_pregunta, bp.puntuacion, img.imagen
FROM banco_preguntas bp JOIN materias_temas mt ON bp.id_tema = mt.id_tema
								JOIN materias_unidades mu ON mt.id_unidad = mu.id_unidad
								JOIN materias_iva m ON mu.id_materia_iva = m.id_materia_iva
								LEFT JOIN escuelas e ON m.nivel = e.nivel
							
								LEFT JOIN banco_imagenes img ON bp.id_pregunta = img.id_pregunta
WHERE bp.id_tema = 7080
GROUP BY bp.id_pregunta;


SELECT *
FROM banco_respuestas br
WHERE id_pregunta = 119495