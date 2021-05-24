SELECT e.nombre_escuela, g.nombre_grupo, m.nombre_materia , ex.mes, al.apellido, al.nombre, ROUND(10*ein.aciertos/ex.aciertos,2) AS calificacion, ein.fecha_fin
FROM examenes_intentos ein LEFT JOIN examenes ex ON ein.id_examen = ex.id_examen
                           JOIN alumnos al ON ein.id_alumno = al.id_alumno
                           JOIN materias m ON ex.id_materia = m.id_materia
                           JOIN grupos g ON m.id_grupo = g.id_grupo
                           JOIN seivas s ON g.id_seiva = s.id_seiva
                           JOIN escuelas e ON s.id_escuela = e.id_escuela
WHERE s.id_ciclo =11 AND ein.fecha_fin > '2018-10-23 00:00:00' AND nombre_escuela = 'SECUNDARIA EDISON' and apellido LIKE 'Hern%'#AND m.nombre_materia LIKE 'ING%'
#WHERE s.id_ciclo =10 AND ein.fecha_fin > '2018-05-21 00:00:00' AND nombre_escuela = 'PREPARATORIA EDISON' AND m.nombre_materia = 'MATEMÃ�TICAS IV'
#WHERE s.id_ciclo = 9  AND nombre_escuela = 'SECUNDARIA EDISON' AND nombre_materia LIKE 'Ingl%' AND al.nombre LIKE '%Albany%'
ORDER BY nombre_materia, nombre_grupo, apellido
LIMIT 1000;


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
