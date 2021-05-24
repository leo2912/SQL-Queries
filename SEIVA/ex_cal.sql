SELECT s.nombre_seiva, e.nombre_escuela, g.nombre_grupo, m.nombre_materia, ce.mes, a.apellido, ce.calificacion, max(ce.fecha_actualizacion), ce.*#, ce.calificacion # avg(ce.calificacion), count(ce.calificacion)
FROM seivas s JOIN grupos g ON s.id_seiva = g.id_seiva
			JOIN escuelas e ON s.id_escuela = e.id_escuela
            JOIN materias m ON g.id_grupo = m.id_grupo
            JOIN inscripcion_materia im ON m.id_materia = im.id_materia
            JOIN calificaciones_examen ce ON im.id_inscripcion = ce.id_inscripcion
            JOIN alumnos a ON im.id_alumno = a.id_alumno
			
#WHERE  (g.id_grupo > 1369 and g.id_grupo < 1376) AND nombre_materia LIKE '%Ingles 1%'
WHERE  g.id_grupo IN (1528, 1529, 1530) AND (ce.mes = 2) AND nombre_materia LIKE 'Literatura%'
group by s.nombre_seiva, e.nombre_escuela, g.nombre_grupo, m.nombre_materia, ce.mes, a.apellido, ce.calificacion
ORDER BY e.nombre_escuela, g.nombre_grupo,  m.nombre_materia, ce.mes, a.apellido;
