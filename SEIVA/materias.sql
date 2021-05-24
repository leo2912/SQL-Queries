SELECT s.nombre_seiva, e.nombre_escuela, g.nombre_grupo, m.nombre_materia
FROM seivas s JOIN grupos g ON s.id_seiva = g.id_seiva
			JOIN escuelas e ON s.id_escuela = e.id_escuela
            JOIN materias m ON g.id_grupo = m.id_grupo
            

WHERE nombre_escuela = "Primaria Centro" AND nombre_seiva = '2016 - 2017'
ORDER BY e.nombre_escuela, g.nombre_grupo, m.nombre_materia;
