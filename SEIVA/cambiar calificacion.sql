SELECT a.nombre, c.id_inscripcion, m.nombre_materia, c.mes, c.calificacion
FROM calificaciones c JOIN inscripcion_materia i on c.id_inscripcion = i.id_inscripcion
					  JOIN materias m on i.id_materia = m.id_materia
                      JOIN alumnos a on i.id_alumno = a.id_alumno
WHERE a.nombre LIKE "Georgina Araceli" AND m.nombre_materia ="literatura ii";

SELECT *
FROM calificaciones
WHERE id_inscripcion = 193382;

UPDATE `seiva`.`calificaciones` SET `calificacion`='10' WHERE `id_inscripcion`='193382';
UPDATE `seiva`.`calificaciones` SET `calificacion`='10' WHERE `id_inscripcion`='193382';
UPDATE `seiva`.`calificaciones` SET `calificacion`='10' WHERE `id_inscripcion`='193382';
UPDATE `seiva`.`calificaciones` SET `calificacion`='10' WHERE `id_inscripcion`='193382';
UPDATE `seiva`.`calificaciones` SET `calificacion`='10' WHERE `id_inscripcion`='193382';
UPDATE `seiva`.`calificaciones` SET `calificacion`='10' WHERE `id_inscripcion`='193382';
UPDATE `seiva`.`calificaciones` SET `calificacion`='10' WHERE `id_inscripcion`='193382';
