SELECT q.name, u.lastname, u.firstname, qg.grade, from_unixtime(q.timeclose)
FROM mdl_quiz q JOIN mdl_course c ON q.course = c.id
				JOIN mdl_quiz_grades qg ON q.id = qg.quiz
                JOIN mdl_user u ON qg.userid = u.id

WHERE (c.id = 3337 OR c.id = 3611) AND q.NAME LIKE ('%Extra%')