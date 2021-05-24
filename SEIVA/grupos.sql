SELECT g.id_grupo, g.nombre_grupo, e.nombre_escuela, s.nombre_seiva
FROM grupos g JOIN seivas s ON g.id_seiva = s.id_seiva
					JOIN escuelas e on s.id_escuela = e.id_escuela
					
WHERE s.id_ciclo > 8 and nombre_escuela LIKE '%Edison%'
