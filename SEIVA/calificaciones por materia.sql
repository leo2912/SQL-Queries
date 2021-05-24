SELECT cic.nombre_ciclo AS ciclo, s.nombre_seiva AS seiva, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, m.nombre_materia AS materia, stp.nombre_mes AS mes, avg(c.calificacion) AS promedio
, std(calificacion) as dispersion, (sum(case when c.calificacion < 6 then 1 else 0 end))/count(calificacion) as ind_rep
    
#,stp.porcentaje AS porcentaje, c.calificacion AS calificacion, (c.calificacion*stp.porcentaje/100) AS ponderado

FROM calificaciones c JOIN inscripcion_materia im on c.id_inscripcion = im.id_inscripcion
					  JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
                      JOIN seivas_tipos_porcentajes stp ON c.mes = stp.mes AND s.tipo_seiva = stp.id_tipo_seiva
                      
WHERE m.tipo_materia = 'A' AND cic.nombre_ciclo = '2015 - 2016' 
		AND e.nombre_escuela NOT IN ('MATERNAL Y KINDER APATZINGÁN', 'PRIMARIA CENTRO', 'SECUNDARIA BUENAVISTA', 'SECUNDARIA EDISON', 'SECUNDARIA LA RUANA', 'SECUNDARIA NUEVA ITALIA', 'PREPARATORIA BUENAVISTA (ESCOLARIZADO)', 'PREPARATORIA EDISON', 'PREPARATORIA NUEVA ITALIA')
group by ciclo, seiva, escuela, grupo, materia, mes

;
