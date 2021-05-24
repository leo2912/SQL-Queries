
SELECT concat('<a target="_new" href="%%WWWROOT%%/course/view.php?id=',c.id,'">',c.fullname,'</a>') AS CourseID
, cat.path, c.fullname AS Nombre_Curso
,( SELECT DISTINCT CONCAT(u.firstname,' ',u.lastname)
  FROM mdl_role_assignments AS ra
  JOIN mdl_user AS u ON ra.userid = u.id
  JOIN mdl_context AS ctx ON ctx.id = ra.contextid
  WHERE ra.roleid = 3 AND ctx.instanceid = c.id AND ctx.contextlevel = 50 LIMIT 1) AS Teacher
 


,COUNT(c.id) AS Total_Materiales
,(SELECT COUNT(*) FROM mdl_course_modules AS cm WHERE cm.course = c.id AND cm.module= 2) AS Tareas
,(SELECT COUNT(*) FROM mdl_course_modules AS cm WHERE cm.course = c.id AND cm.module= 7) AS Foro
,(SELECT COUNT(*) FROM mdl_course_modules AS cm WHERE cm.course = c.id AND cm.module= 13) AS Lecciones
,(SELECT COUNT(*) FROM mdl_course_modules AS cm WHERE cm.course = c.id AND cm.module= 16) AS Examenes
,(SELECT COUNT(*) FROM mdl_course_modules AS cm WHERE cm.course = c.id AND cm.module= 17) AS Lecturas
 
FROM `mdl_resource` AS r 
JOIN `mdl_course` AS c ON c.id = r.course
JOIN mdl_course_categories cat ON c.category = cat.id
#JOIN mdl_enrol enr ON c.id = enr.courseid
#JOIN mdl_user_enrolments enrs ON enrs.enrolid = enr.id
#WHERE TYPE= 'file' AND reference NOT LIKE 'http://%' 
 
#WHERE 1=1
#%%FILTER_YEARS:c.fullname%%
#AND c.fullname LIKE '%2013%'
 
GROUP BY course
ORDER BY COUNT(c.id) DESC