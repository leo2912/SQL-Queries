SELECT e.nombre_escuela, g.nombre_grupo, m.nombre_materia , ex.mes, al.apellido, al.nombre, 10*ein.aciertos/ex.aciertos AS calificacion, ein.fecha_fin
FROM examenes_intentos ein LEFT JOIN examenes ex ON ein.id_examen = ex.id_examen
                           JOIN alumnos al ON ein.id_alumno = al.id_alumno
                           JOIN materias m ON ex.id_materia = m.id_materia
                           JOIN grupos g ON m.id_grupo = g.id_grupo
                           JOIN seivas s ON g.id_seiva = s.id_seiva
                           JOIN escuelas e ON s.id_escuela = e.id_escuela
WHERE ein.fecha_fin > '2017-06-12 00:00:00' AND ex.mes > 10 AND nombre_escuela = 'SECUNDARIA EDISON'
ORDER BY nombre_grupo, apellido, nombre_materia;

