USE seiva;
SELECT m.nombre_materia, stp.nombre_mes, e.id_examen, e.aciertos, e.fecha_creacion, COUNT(inte.id_intento)
FROM examenes e JOIN seivas_tipos_porcentajes stp ON e.mes = stp.mes
	JOIN materias m ON e.id_materia = m.id_materia
	JOIN examenes_intentos inte ON e.id_examen = inte.id_examen
WHERE e.id_materia = 13315 AND stp.id_tipo_seiva = 6
GROUP BY inte.id_examen