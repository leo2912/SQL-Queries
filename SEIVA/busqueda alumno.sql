

SELECT DIStINCt cic.nombre_ciclo AS ciclo, s.nombre_seiva AS seiva, e.nombre_escuela AS escuela, g.nombre_grupo AS grupo, im.id_alumno AS matricula
FROM inscripcion_materia im JOIN materias m on im.id_materia = m.id_materia
                      JOIN grupos g ON m.id_grupo = g.id_grupo
                      JOIN seivas s ON g.id_seiva = s.id_seiva
                      JOIN escuelas e ON s.id_escuela = e.id_escuela
                      JOIN ciclos cic ON s.id_ciclo = cic.id_ciclo
WHERE im.id_alumno = 000295
                      


