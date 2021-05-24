SELECT c.id_inscripcion, c.mes, COUNT(c.calificacion) MAX(c.fecha_actualizacion)
FROM calificaciones c
GROUP BY c.id_inscripcion, c.mes