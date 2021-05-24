SELECT q.NAME AS Examen, u.lastname AS Apellido, u.firstname AS Nombre, ROUND(qg.grade,2) AS Calificación, from_unixtime(q.timeclose) AS Fecha
FROM mdl_quiz q JOIN mdl_course c ON q.course = c.id
				JOIN mdl_quiz_grades qg ON q.id = qg.quiz
                JOIN mdl_user u ON qg.userid = u.id
WHERE c.id = 3337 and q.name LIKE '%Final%' AND q.NAME NOT LIKE '%Buenavista%'
#WHERE c.id = 3337 and u.lastname = 'Aguirre Valencia'
ORDER BY NAME, lastname, firstname
#WHERE c.id = 3611 and from_unixtime(q.timeclose) > '2018-11-19'