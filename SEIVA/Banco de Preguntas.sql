profesoresSELECT mg.ciclo, mg.escuela, mg.grupo, mg.materia, mg.materia_iva, mu.unidad, mu.nombre_unidad, mt.tema, mt.nombre_tema, p.texto_pregunta, r.texto_respuesta, r.correcta
FROM (SELECT s.nombre_seiva AS ciclo, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, m.nombre_materia AS materia, mi.nombre_materia_iva AS materia_iva, mi.id_materia_iva AS id_mat_iva
		FROM seivas s JOIN grupos g ON s.id_seiva = g.id_seiva
					  JOIN escuelas e ON s.id_escuela = e.id_escuela
					  JOIN materias m ON g.id_grupo = m.id_grupo
                      JOIN materias_iva mi ON m.id_materia_iva = mi.id_materia_iva
		Group by nombre_materia_iva
		ORDER BY nombre_materia_iva) mg

			JOIN materias_unidades mu on  mg.id_mat_iva = mu.id_materia_iva
            JOIN materias_temas mt ON mu.id_unidad = mt.id_unidad
            JOIN banco_historial_preguntas p ON mt.id_tema = p.id_tema
            JOIN banco_historial_respuestas r ON p.id_pregunta_historial = r.id_pregunta_historial
            LEFT JOIN banco_historial_imagenes i ON p.id_pregunta_historial = i.id_pregunta_historial
WHERE i.imagen IS null
ORDER BY mg.escuela, mg.grupo, mg.materia_iva, mu.unidad, mt.tema
