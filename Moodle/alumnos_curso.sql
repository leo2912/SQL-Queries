USE moodleiva;
SELECT DISTINCT u.username, u.firstname, u.lastname, u.email, u.city, u.suspended
#SELECT DISTINCT u.username
FROM mdl_course c JOIN mdl_enrol en ON c.id = en.courseid
JOIN moodleiva.mdl_user_enrolments ue ON en.id = ue.enrolid
JOIN mdl_user u ON ue.userid = u.id

#Prepa Sabatina
#WHERE c.id = 4229
WHERE c.id IN (SELECT c.id FROM mdl_course c WHERE c.category IN (476, 477, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 498, 499, 500, 503, 526, 527, 528, 529, 530, 531, 532, 533, 534))
ORDER BY username, lastname, firstname
