USE moodleiva;


SET @course := 4185;
SELECT gmem.name, u.username, u.lastname AS Apellido, u.firstname AS Nombre
FROM mdl_course c JOIN mdl_enrol me ON c.id = me.courseid
JOIN mdl_user_enrolments mue ON me.id = mue.enrolid
JOIN mdl_user u ON mue.userid = u.id
LEFT JOIN 
	(SELECT mg.name, mgm.userid
		FROM mdl_course mc JOIN mdl_groups mg ON mc.id = mg.courseid 
		JOIN mdl_groups_members mgm ON mg.id = mgm.groupid
		WHERE mc.id = @course) AS gmem ON mue.userid = gmem.userid

WHERE c.id = @course