SELECT u.firstname AS 'Name' , u.lastname AS 'Surname', c.fullname AS 'Course', cc.name AS 'Category', 
CASE WHEN gi.itemtype = 'Course'    
THEN c.fullname + ' Course Total'  
ELSE gi.itemname 
END AS 'Item Name', ROUND(gg.finalgrade,2) AS Score,ROUND(gg.rawgrademax,2) AS MAX, ROUND(gg.finalgrade / gg.rawgrademax * 100 ,2) AS Percentage,
 
IF (ROUND(gg.finalgrade / gg.rawgrademax * 100 ,2) > 79,'Yes' , 'No') AS Pass
 
FROM mdl_course AS c 
JOIN mdl_context AS ctx ON c.id = ctx.instanceid 
JOIN mdl_role_assignments AS ra ON ra.contextid = ctx.id 
JOIN mdl_user AS u ON u.id = ra.userid 
JOIN mdl_grade_grades AS gg ON gg.userid = u.id 
JOIN mdl_grade_items AS gi ON gi.id = gg.itemid 
JOIN mdl_course_categories AS cc ON cc.id = c.category 
WHERE  gi.courseid = c.id AND gi.itemname != 'Attendance' AND u.username = 'a162022'
ORDER BY `Name` ASC