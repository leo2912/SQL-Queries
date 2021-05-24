SELECT p.texto_pregunta, i.imagen, id_pregunta
FROM banco_historial_preguntas p JOIN banco_historial_imagenes i ON p.id_pregunta_historial = i.id_pregunta_historial
WHERE id_pregunta IN (25453)
