SELECT municipio, SUM(totaldealumnos) AS total_alumnos, SUM((CASE when control = "PRIVADO" THEN totaldealumnos END)) AS alumnos_privada, SUM((CASE when control = "PRIVADO" THEN totaldealumnos END))/SUM(totaldealumnos) AS porc_priv
FROM 'escuelas michoacán'
GROUP BY Municipio
ORDER BY municipio