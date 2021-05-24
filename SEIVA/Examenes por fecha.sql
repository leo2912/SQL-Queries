SELECT e.id_examen, m.id_materia, m.nombre_materia, e.fecha_cierre
FROM examenes e JOIN materias m ON e.id_materia = m.id_materia
ORDER BY e.fecha_cierre DESC