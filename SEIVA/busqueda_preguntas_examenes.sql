SELECT e.mes, e.fecha_creacion, a.apellido, a.nombre
FROM examenes_preguntas ep JOIN examenes_intentos ei ON ep.id_examen = ei.id_examen
									JOIN examenes e ON ei.id_examen = e.id_examen
									JOIN alumnos a ON ei.id_alumno = a.id_alumno
WHERE ep.id_pregunta_historial = 158644