SELECT DISTINCT e.nombre_escuela, g.nombre_grupo, al.id_alumno, al.apellido, al.nombre
FROM examenes_intentos ein LEFT JOIN examenes ex ON ein.id_examen = ex.id_examen
                           JOIN alumnos al ON ein.id_alumno = al.id_alumno
                           JOIN materias m ON ex.id_materia = m.id_materia
                           JOIN grupos g ON m.id_grupo = g.id_grupo
                           JOIN seivas s ON g.id_seiva = s.id_seiva
                           JOIN escuelas e ON s.id_escuela = e.id_escuela
#WHERE ein.fecha_fin > '2017-01-01 00:00:00' AND ex.mes > 10 AND nombre_escuela = 'SECUNDARIA EDISON' AND fecha_fin > '2017-07-10 00:00:00' #AND (ROUND (10*ein.aciertos/ex.aciertos,2) < 6)
WHERE s.id_ciclo =10 AND ein.fecha_fin > '2017-11-15 00:00:00' AND nombre_escuela LIKE '%Edison'
#WHERE s.id_ciclo = 9  AND nombre_escuela = 'SECUNDARIA EDISON' AND nombre_materia LIKE 'Ingl%' AND al.nombre LIKE '%Albany%'
ORDER BY nombre_escuela, nombre_grupo, al.apellido;


-- SELECT s.nombre_seiva, e.nombre_escuela, g.nombre_grupo, m.nombre_materia, a.apellido, ex.mes, ex.cal, max(ex.fecha)
-- FROM (SELECT ce.id_inscripcion AS ins, ce.mes AS mes, ce.id_usuario AS usuario, ce.calificacion AS cal, max(ce.fecha_actualizacion) AS fecha
-- FROM calificaciones_examen ce
-- 
-- GROUP BY ce.id_inscripcion, ce.mes, ce.id_usuario, ce.calificacion
-- ORDER BY mes, fecha DESC) ex
-- JOIN inscripcion_materia im ON ex.ins = im.id_inscripcion
-- JOIN alumnos a ON im.id_alumno = a.id_alumno
-- JOIN materias m ON im.id_materia = m.id_materia
-- JOIN grupos g ON m.id_grupo = g.id_grupo
-- JOIN seivas s ON g.id_seiva = s.id_seiva
-- JOIN escuelas e ON s.id_escuela = e.id_escuela
-- WHERE (g.id_grupo > 1369 and g.id_grupo < 1376) AND (ex.mes = 8)
-- GROUP BY s.nombre_seiva, e.nombre_escuela, g.nombre_grupo, m.nombre_materia, a.apellido, ex.mes
