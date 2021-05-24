USE moodleiva;

SELECT mc.id, mc.category, mc.fullname, mcc.`path` 
FROM mdl_course mc JOIN mdl_course_categories mcc ON mc.category = mcc.id
WHERE mcc.`path` LIKE '/4%' OR mcc.`path` LIKE '/5/16%' OR mcc.`path` LIKE '/9/182'