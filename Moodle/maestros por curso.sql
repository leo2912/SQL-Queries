SELECT DISTINCT c.fullname AS course_name, cat.name AS category_name, u.firstname, u.lastname, u.email
FROM mdl_course c JOIN mdl_course_categories cat ON c.category  = cat.id
				  JOIN mdl_enrol e ON c.id = e.courseid
                  JOIN mdl_user_enrolments ue ON e.id = ue.enrolid
                  join mdl_user u ON ue.userid = u.id
				  
WHERE u.lastlogin > 1475280000 AND cat.name LIKE '%Semestre' AND (email NOT LIKE 'a0%' AND email NOT LIKE 'a1%')
