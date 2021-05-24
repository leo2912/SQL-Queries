SELECT c.nombre_ciclo, e.nombre_escuela, g.nombre_grupo, ig.id_alumno, a.apellido, a.nombre
FROM inscripcion_grupo ig
		JOIN grupos g ON ig.id_grupo = g.id_grupo
		JOIN seivas s ON g.id_seiva = s.id_seiva
		JOIN inscripcion_escuela ie ON s.id_escuela = ie.id_escuela AND s.id_ciclo = ie.id_ciclo AND ig.id_alumno = ie.id_alumno
		JOIN escuelas e ON ie.id_escuela = e.id_escuela
		JOIN ciclos c ON s.id_ciclo = c.id_ciclo
		JOIN alumnos a ON ig.id_alumno = a.id_alumno

