SELECT q.NAME AS Examen, COUNT(qg.grade) AS Alumnos, ROUND(AVG(qg.grade),2) AS Calificación, ROUND(STDDEV_POP(qg.grade),2) AS 'DesvESt', SUM(CASE WHEN qg.grade < 6 THEN 1 ELSE 0 END) AS Reprobados
FROM mdl_quiz q JOIN mdl_course c ON q.course = c.id
				JOIN mdl_quiz_grades qg ON q.id = qg.quiz
                #JOIN mdl_user u ON qg.userid = u.id
WHERE c.id = 3611 and q.name LIKE 'Final%'
GROUP BY q.NAME 
ORDER BY NAME

#WHERE c.id = 3611 and from_unixtime(q.timeclose) > '2018-11-19'