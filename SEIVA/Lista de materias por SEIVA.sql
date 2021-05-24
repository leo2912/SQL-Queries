SELECT DISTINCT(m.nombre_materia), nombre_seiva
FROM seivas s JOIN grupos g ON s.id_seiva = g.id_seiva
			JOIN escuelas e ON s.id_escuela = e.id_escuela
            JOIN materias m ON g.id_grupo = m.id_grupo
            

WHERE nombre_seiva = '2016 - 2017' OR nombre_seiva = 'SEPTIEMBRE - DICIEMBRE 2016'
ORDER BY m.nombre_materia