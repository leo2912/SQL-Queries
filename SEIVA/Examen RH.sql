SELECT * FROM seiva.preguntas_examenes
WHERE ((nombre_materia LIKE 'Administraci%n' OR nombre_materia LIKE 'Fundamentos de Administraci%' OR nombre_materia LIKE '%Recursos Humanos%') AND nombre_materia NOT LIKE '%Prod%')
AND (nombre_tema LIKE '%Humanos%' OR nombre_tema LIKE 'R.H' OR nombre_tema LIKE '%RH%') AND texto_pregunta = '1.- ¿Que son los conflictos laborales?'