#SELECT esc.nombre_escuela, s.nombre_seiva, 
SELECT  g.nombre_grupo, m.nombre_materia, e.clave, e.fecha_disponible, e.mes, stp.nombre_mes
#SELECT e.id_examen
FROM seiva.examenes e JOIN materias m on e.id_materia = m.id_materia
						join grupos g on m.id_grupo = g.id_grupo
                        join seivas s on g.id_seiva = s.id_seiva
                        join escuelas esc on s.id_escuela = esc.id_escuela
                        join seivas_tipos_porcentajes stp on e.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
                        
Where fecha_disponible > '2018-11-07 00:00:00' AND esc.nombre_escuela LIKE '%Edison%'
#WHERE e.mes = 22 AND esc.nombre_escuela LIKE '%Edison%' AND fecha_creacion > '2017-01-01 1:00:00' AND (nombre_materia LIKE 'Eco%' OR nombre_materia LIKE 'Esp%')

#order by esc.nombre_escuela, nombre_grupo, fecha_disponible, nombre_materia
order by esc.nombre_escuela, nombre_grupo, nombre_materia,  fecha_disponible