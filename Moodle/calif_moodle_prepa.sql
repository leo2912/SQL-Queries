USE moodleiva;
#Secundaria
SET @course := 4184;

#Prepa
#SET @course := 4185;

#Prepa Abierta
#SET @course := 4263;

#Inglés
#SET @course := 3337;

SELECT REPLACE(q.NAME, ' - ','|') AS 'Examen,Grado,Materia', gmem.sede AS Sede, u.lastname AS Apellido, u.firstname AS Nombre, ROUND(qg.grade,2) AS Calificación, from_unixtime(qg.timemodified) AS 'Fecha de realización', from_unixtime(q.timeclose) AS 'Fecha de Cierre'
FROM mdl_quiz q JOIN mdl_course c ON q.course = c.id
				JOIN mdl_quiz_grades qg ON q.id = qg.quiz
                JOIN mdl_user u ON qg.userid = u.id
                LEFT JOIN (SELECT mg.name AS 'sede', mgm.userid
						FROM mdl_course mc JOIN mdl_groups mg ON mc.id = mg.courseid 
						JOIN mdl_groups_members mgm ON mg.id = mgm.groupid
						WHERE mc.id = @course) AS gmem ON qg.userid = gmem.userid

WHERE c.id = @course #AND q.name LIKE '%Feb%'

#WHERE from_unixtime(q.timeclose) > '2019-06-24'


ORDER BY NAME, lastname, firstname
