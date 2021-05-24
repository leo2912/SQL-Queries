USE moodleiva;

SELECT
	
	q.name,
	q.password
FROM
	mdl_quiz q
WHERE
	(from_unixtime(q.timeclose) > CURDATE())
	AND (from_unixtime(q.timeclose) < CURDATE()+1)
	AND q.course IN (3337,4185,4184)
	
	#WHERE (from_unixtime(q.timeclose) > '2019-07-01 00:00:00') AND q.course IN (3613)
	#WHERE (from_unixtime(q.timeclose) > '2019-05-13 00:00:00') AND q.course IN (3611)

	ORDER BY q.course,
	q.name