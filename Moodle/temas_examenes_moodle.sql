USE moodleiva;
SELECT  c.fullname, q.id, q.name, cat4.name as lv4, cat3.name as lv3, cat2.name as lv2, cat.name as lv1, COUNT(ques.id)
FROM mdl_question ques
	JOIN mdl_question_attempts qat ON ques.id = qat.questionid
	JOIN mdl_question_usages qus ON qat.questionusageid = qus.id
	JOIN mdl_quiz_attempts qzat ON qzat.uniqueid = qus.id
	JOIN mdl_quiz q ON qzat.quiz = q.id
	JOIN mdl_question_categories cat ON ques.category = cat.id
	LEFT JOIN mdl_question_categories cat2 ON cat2.id = cat.parent
	LEFT JOIN mdl_question_categories cat3 ON cat3.id = cat2.parent
	LEFT JOIN mdl_question_categories cat4 ON cat4.id = cat3.parent
	JOIN mdl_course c ON q.course = c.id
	JOIN mdl_course_modules cm ON q.id = cm.instance
WHERE c.id = 3550 AND cm.id IN (121872)
GROUP BY c.fullname, q.id, q.name, lv4, lv3, lv2, lv1
ORDER BY q.id, q.name, lv4, lv3, lv2, lv1

	#JOIN mdl_quiz_attempts qzate ON qat.



/*SELECT q.id, q.name, COUNT(qusag.id)
FROM mdl_quiz q
#JOIN mdl_quiz_attempts qatem ON qatem.quiz = q.id
JOIN mdl_question_usages qusag ON q.id = qusag.contextid
WHERE (from_unixtime(q.timeclose) > '2019-05-27 00:00:00') AND q.course IN (3611, 3550)#, 3337)
#WHERE (from_unixtime(q.timeclose) > '2019-05-13 00:00:00') AND q.course IN (3611)
GROUP BY q.id, q.name
ORDER BY q.course, q.name*/