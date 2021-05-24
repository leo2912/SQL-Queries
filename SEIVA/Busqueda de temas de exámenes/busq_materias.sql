USE seiva;
SELECT s.nombre_seiva, s.tipo_seiva, e.nombre_escuela, g.nombre_grupo, m.*
FROM materias m JOIN grupos g ON m.id_grupo = g.id_grupo
		JOIN seivas s ON g.id_seiva = s.id_seiva
		JOIN escuelas e ON s.id_escuela = e.id_escuela
		#JOIN ciclos c ON s.id_ciclo = c.id_ciclo
WHERE m.nombre_materia LIKE 'Lit%' and nombre_escuela = "Preparatoria Edison"
#WHERE m.nombre_materia LIKE '%Fis%' and nombre_escuela = "Preparatoria Edison"