SELECT e.municipio, e.total_alumnos, e.alumnos_privada
FROM (SELECT municipio, SUM(`TOTAL DE ALUMNOS`) AS total_alumnos, SUM((CASE when control = "PRIVADO" THEN `TOTAL DE ALUMNOS` END)) AS alumnos_privada
	  FROM escuelas_mich
      GROUP BY Municipio
		ORDER BY municipio) e
