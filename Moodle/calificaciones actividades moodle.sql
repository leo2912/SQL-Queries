USE moodleiva;

SET lc_time_names = 'es_MX';


SELECT 
CASE 
	WHEN mcc.`path` LIKE '/2/%' OR mcc.`path` = '/2' THEN 'Preescolar'
	WHEN mcc.`path` LIKE '/3/%' OR mcc.`path` = '/3' THEN 'Primaria'
	WHEN mcc.`path` LIKE '/4/%' THEN 'Secundaria'
	WHEN mcc.`path` LIKE '/5/16/%' THEN 'Preparatoria Escolarizada'
	WHEN mcc.`path` LIKE '/5/17/%' THEN 'Preparatoria Abierta'
	WHEN mcc.`path` LIKE '/7/%' OR mcc.`path` = '/7' THEN 'Universidad'
	WHEN mcc.`path` LIKE '/9/%' THEN 'Inglés'
	ELSE 'Otros' 
	END AS 'Categoria',
CONCAT(cou.shortname, ' ', cou.fullname) AS 'Curso',
CONCAT(
CASE 
WHEN mcs.`section` < 10 THEN CONCAT('0',mcs.`section`)
ELSE mcs.`section`
END, " | ",
CASE 
	WHEN (mcs.name IS NULL OR LENGTH(mcs.name) = 0) THEN FROM_UNIXTIME(cou.startdate + (604799*(mcs.`section`-1)), '%M, %e')  
	ELSE mcs.name
END) AS 'Semana/Sección',

gi.itemmodule AS 'Tipo de Actividad', gi.itemname AS 'Actividad', us.username AS 'Matrícula', #mg.name AS 'Grupo', 
CONCAT(us.lastname, ' ', us.firstname) AS 'Nombre', finalgrade AS 'Calificación', 

IF(GREATEST (IFNULL(mqa.timefinish,0),IFNULL(mas.timemodified,0),IFNULL(mlg.completed,0),IFNULL(mfg.timemodified,0))>0,
	FROM_UNIXTIME(GREATEST (IFNULL(mqa.timefinish,0),IFNULL(mas.timemodified,0),IFNULL(mlg.completed,0),IFNULL(mfg.timemodified,0)),'%Y-%m-%d %H:%i'),NULL)  
AS 'Fecha de envío',
IF(GREATEST(IFNULL(mq.timeclose,0),IFNULL(ma.duedate,0),IFNULL(ml.deadline,0),IFNULL(mf.duedate,0))>0,
FROM_UNIXTIME(GREATEST(IFNULL(mq.timeclose,0),IFNULL(ma.duedate,0),IFNULL(ml.deadline,0),IFNULL(mf.duedate,0)),'%Y-%m-%d %H:%i'),NULL) 
AS 'Fecha de Cierre'

FROM mdl_grade_grades gg JOIN mdl_grade_items gi ON gg.itemid = gi.id
JOIN mdl_course cou ON gi.courseid = cou.id
JOIN mdl_user us ON gg.userid = us.id
JOIN mdl_modules mm ON gi.itemmodule = mm.name
JOIN mdl_course_modules mcm ON mcm.`instance` = gi.iteminstance AND mcm.course = cou.id
JOIN mdl_course_sections mcs  ON mcm.`section` = mcs.id
JOIN mdl_course_categories mcc ON cou.category = mcc.id
#LEFT JOIN mdl_groups mg ON cou.id = mg.courseid
#LEFT JOIN mdl_groups_members mgm ON mg.id = mgm.groupid AND us.id = mgm.userid 

LEFT OUTER JOIN mdl_quiz mq ON gi.iteminstance = mq.id AND gi.itemmodule = 'quiz'
LEFT OUTER JOIN mdl_quiz_attempts mqa ON mqa.quiz = mq.id AND us.id = mqa.userid 
LEFT OUTER JOIN mdl_assign ma ON mcm.`instance` = ma.id AND gi.itemmodule = 'assign'
LEFT OUTER JOIN mdl_assign_submission mas ON ma.id = mas.`assignment` AND us.id = mas.userid 
LEFT OUTER JOIN mdl_lesson ml ON mcm.`instance` = ml.id AND gi.itemmodule = 'lesson'
LEFT OUTER JOIN mdl_lesson_grades mlg ON ml.id = mlg.lessonid AND us.id = mlg.userid
LEFT OUTER JOIN mdl_forum mf ON mcm.`instance` = mf.id AND gi.itemmodule = 'forum'
LEFT OUTER JOIN mdl_forum_grades mfg ON mf.id = mfg.forum AND us.id = mfg.userid

WHERE gi.itemtype = 'mod' AND mcm.visible = 1 AND cou.startdate >= 1596240000  #AND cou.id = 152; # AND us.username = 'a200304180' 
