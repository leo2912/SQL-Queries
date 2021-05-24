CREATE TABLE preguntas_examenes
SELECT s.nombre_seiva, e.nombre_escuela, g.nombre_grupo, m.nombre_materia, mi.nombre_materia_iva, mu.unidad, mu.nombre_unidad, mt.tema, mt.nombre_tema, p.texto_pregunta, r.texto_respuesta, r.correcta
FROM seivas s JOIN grupos g ON s.id_seiva = g.id_seiva
			JOIN escuelas e ON s.id_escuela = e.id_escuela
            JOIN materias m ON g.id_grupo = m.id_grupo
            JOIN materias_iva mi ON m.id_materia_iva = mi.id_materia_iva
			JOIN materias_unidades mu on  mi.id_materia_iva = mu.id_materia_iva
            JOIN materias_temas mt ON mu.id_unidad = mt.id_unidad
            JOIN banco_historial_preguntas p ON mt.id_tema = p.id_tema
            JOIN banco_historial_respuestas r ON p.id_pregunta_historial = r.id_pregunta_historial
            LEFT JOIN banco_historial_imagenes i ON p.id_pregunta_historial = i.id_pregunta_historial
WHERE i.imagen IS null
ORDER BY e.nombre_escuela, g.nombre_grupo, mi.nombre_materia_iva, mu.unidad, mt.tema
