SELECT cat.path, c.fullname, modu.NAME, COUNT(cmodu.id)
FROM mdl_course c JOIN mdl_course_categories cat ON c.category = cat.id
						JOIN mdl_course_modules cmodu ON cmodu.course = c.id
						JOIN mdl_modules modu ON modu.id = cmodu.module
#WHERE c.startdate

GROUP BY cat.path, c.fullname, modu.NAME
