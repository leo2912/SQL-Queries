SELECT e.nombre_escuela, g.nombre_grupo, m.nombre_materia, al.apellido, al.nombre, MAX(ROUND(10*ein.aciertos/ex.aciertos,2)) AS calificacion
FROM examenes_intentos ein LEFT JOIN examenes ex ON ein.id_examen = ex.id_examen
                           JOIN alumnos al ON ein.id_alumno = al.id_alumno
                           JOIN materias m ON ex.id_materia = m.id_materia
                           JOIN grupos g ON m.id_grupo = g.id_grupo
                           JOIN seivas s ON g.id_seiva = s.id_seiva
                           JOIN escuelas e ON s.id_escuela = e.id_escuela
WHERE ex.mes > 10 AND nombre_escuela = 'PREPARATORIA EDISON' AND fecha_fin > '2018-01-01 00:00:00' AND s.id_ciclo = 10  #AND (ROUND (10*ein.aciertos/ex.aciertos,2) < 6)
#WHERE ein.fecha_fin > '2017-06-26 00:00:00' AND ex.mes >10 AND nombre_escuela = 'PREPARATORIA EDISON'
GROUP BY e.nombre_escuela, g.nombre_grupo, m.nombre_materia ,  al.apellido, al.nombre
HAVING calificacion < 6
ORDER BY nombre_grupo, apellido, nombre_materia;