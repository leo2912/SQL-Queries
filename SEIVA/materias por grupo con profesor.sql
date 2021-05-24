SELECT m.id_grupo, p.apellido_profesor, m.nombre_materia
FROM materias m JOIN profesores p ON m.id_profesor = p.id_profesor
WHERE m.id_grupo IN (1361,1362,1363)