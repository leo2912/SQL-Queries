SELECT bp.texto_pregunta, br.texto_respuesta, br.correcta
FROM banco_preguntas bp JOIN banco_respuestas br ON bp.id_pregunta = br.id_pregunta
WHERE bp.id_tema = 8515
ORDER BY bp.texto_pregunta, br.correcta DESC

-- SELECT bp.texto_pregunta
-- FROM banco_preguntas bp
-- WHERE bp.id_tema = 8419
-- ORDER BY texto_pregunta;
-- 
-- SELECT bp.texto_pregunta
-- FROM banco_preguntas bp
-- WHERE bp.id_tema = 8420
-- ORDER BY texto_pregunta;
-- 