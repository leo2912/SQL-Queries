SELECT e.id_escuela, e.nombre_escuela, g.nombre_grupo, m.nombre_materia, m.id_materia_iva
FROM materias m JOIN grupos g on m.id_grupo = g.id_grupo
					JOIN seivas s on g.id_seiva = s.id_seiva
					JOIN escuelas e ON s.id_escuela = e.id_escuela
WHERE s.id_ciclo = 11 AND e.id_escuela = 3