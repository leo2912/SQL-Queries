#SELECT q.name, sec.name, u.lastname, u.firstname, qg.grade, from_unixtime(q.timeclose)
SELECT q.NAME, u.lastname, u.firstname, qg.grade, from_unixtime(q.timeclose)
FROM mdl_quiz q JOIN mdl_course c ON q.course = c.id
				JOIN mdl_quiz_grades qg ON q.id = qg.quiz
                JOIN mdl_user u ON qg.userid = u.id
                #LEFT JOIN mdl_course_sections sec ON c.id = sec.course
#WHERE c.id = 3337 and sec.name RLIKE ('Nov|Dic')
WHERE c.id = 3337 and q.NAME LIKE ('%Extra%')