SELECT c.nombre_ciclo,e.nombre_escuela, e.tipo_periodo, e.tipo_seiva, a.id_alumno, a.apellido, a.nombre
FROM alumnos a JOIN inscripcion_escuela ine ON a.id_alumno = ine.id_alumno
				JOIN escuelas e ON ine.id_escuela = e.id_escuela
				JOIN ciclos c ON ine.id_ciclo = c.id_ciclo
WHERE a.apellido LIKE 'Macias Villalobos'
