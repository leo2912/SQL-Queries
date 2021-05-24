SELECT e.id_examen, ROUND((AVG(inte.aciertos/e.aciertos))*10,2) AS calificacion_promedio, ROUND(STD(inte.aciertos/e.aciertos),2) AS dispersion
FROM examenes e JOIN examenes_intentos inte ON e.id_examen = inte.id_examen
					 
WHERE e.id_examen = 22815 AND inte.aciertos > 0
GROUP BY e.id_examen
