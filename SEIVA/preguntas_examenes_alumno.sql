SELECT porc.nombre_mes AS Mes, preg.texto_pregunta AS Pregunta, res.texto_respuesta AS 'Respuuesta Correcta'
FROM examenes_cuestionario cue JOIN banco_historial_preguntas preg ON cue.id_pregunta_historial = preg.id_pregunta_historial
JOIN banco_historial_respuestas res ON preg.id_pregunta_historial = res.id_pregunta_historial
JOIN examenes_intentos inte ON cue.id_intento = inte.id_intento
JOIN examenes ex ON inte.id_examen = ex.id_examen
JOIN seivas_tipos_porcentajes porc ON ex.mes = porc.mes
WHERE cue.id_intento IN (434535, 439735, 443938) AND res.correcta = 1 AND porc.id_tipo_seiva = '10E'