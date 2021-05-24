SELECT bp.id_pregunta, bp.texto_pregunta, GROUP_CONCAT(CASE WHEN br.correcta = 1 THEN br.texto_respuesta END), GROUP_CONCAT(CASE WHEN br.correcta = 0 THEN br.texto_respuesta END SEPARATOR '|')
FROM banco_preguntas bp
JOIN banco_respuestas br ON bp.id_pregunta = br.id_pregunta
WHERE bp.id_tema = 8824
GROUP BY bp.id_pregunta
ORDER BY id_pregunta, br.correcta

