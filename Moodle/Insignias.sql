USE moodleiva;
SELECT c.fullname, u.firstname, u.lastname, b.name, from_unixtime(mi.dateissued) AS fecha
FROM moodleiva.mdl_course c JOIN mdl_enrol e ON c.id = e.courseid
	JOIN mdl_user_enrolments ue ON e.id = ue.enrolid
	JOIN mdl_user u ON ue.userid = u.id
	JOIN mdl_badge b ON c.id = b.courseid
	LEFT JOIN mdl_badge_issued mi ON (ue.userid = mi.userid AND b.id = mi.badgeid)
	
WHERE c.fullname = "Ciencias II (Enfásis en Física)"
ORDER BY fecha, lastname