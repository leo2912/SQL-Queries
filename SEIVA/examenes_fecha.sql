SELECT e.id_examen, m.nombre_materia, g.nombre_grupo, es.nombre_escuela, stp.nombre_mes_corto
FROM examenes e JOIN materias m ON e.id_materia = m.id_materia
					JOIN grupos g ON m.id_grupo = g.id_grupo
					JOIN seivas s on g.id_seiva = s.id_seiva
					JOIN escuelas es ON s.id_escuela = es.id_escuela
					JOIN seivas_tipos_porcentajes stp ON e.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
WHERE e.fecha_cierre BETWEEN '2018-2-13' AND '2018-2-14'