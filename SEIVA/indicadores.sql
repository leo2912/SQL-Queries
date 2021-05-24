SELECT ciclo, escuela, AVG(cal_final), stddev(cal_final)
FROM seiva.cal_fin_alumno
WHERE ciclo = "2013 - 2014" OR ciclo = "2014 - 2015" OR ciclo = "2015 - 2016" 
GROUP BY ciclo, escuela;


SELECT re.ciclo, re.escuela, SUM(if (promedio < 6, 1,0))/COUNT(re.matricula) AS indice_reprobacion
FROM(
	SELECT ciclo, escuela, grupo, matricula, AVG(cal_final) AS Promedio
	FROM seiva.cal_fin_alumno
	WHERE ciclo = "2013 - 2014" OR ciclo = "2014 - 2015" OR ciclo = "2015 - 2016" 
	GROUP BY ciclo, escuela, grupo, matricula
) re
GROUP BY re.ciclo, re.escuela;

